import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tickets/app/data/builder/dio_builder.dart';
import 'package:tickets/presentation/main/controller/ticket_controller.dart';
import 'package:tickets/presentation/main/data/enum/category.dart';
import 'package:tickets/presentation/main/data/enum/color.dart';
import 'package:tickets/presentation/main/view/save_ticket_screen.dart';
import 'package:tickets/presentation/main/view/select_ticket_layout_screen.dart';

import '../data/model/category_model.dart';
import '../data/model/ticket_model.dart';
import '../view/my_ticket_screen.dart';
import '../view/register_ticket_screen.dart';

class MakeTicketController extends GetxController {
  // Screen Control
  final List<Widget> screens = [
    const MyTicketScreen(),
    const RegisterTicketScreen(),
    const SelectTicketLayoutScreen(),
    SaveTicketScreen(),
  ];

  final RxInt currentIndex = 0.obs;

  // Ticket
  late Rx<TicketModel> makeTicketModel = TicketModel(
    id: null,
    title: "",
    imagePath: "",
    ticketDate: DateTime.now(),
    rating: 4.5,
    memo: "",
    seat: "",
    location: "",
    price: null,
    friend: "",
    color: ColorType.white.id.toString(),
    ticketType: "",
    layoutType: "",
    category: const CategoryModel(id: 0, name: ""),
  ).obs;

  final Rx<XFile?> imageFile = XFile("").obs;
  final TextEditingController titleController = TextEditingController();
  final Rx<CategoryType> selectedCategory = CategoryType.movie.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxDouble selectedRating = 4.5.obs;
  final TextEditingController memoController = TextEditingController();
  final RxInt memoTextLength = 0.obs;
  final TextEditingController locationController = TextEditingController();
  final TextEditingController friendController = TextEditingController();
  final TextEditingController seatController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final RxInt selectedColor = 0.obs;
  final RxBool isPrivate = false.obs;

  final RxBool isUploading = false.obs;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();

    imageFile.value = await picker.pickImage(source: ImageSource.gallery);
  }

  void editTicket(TicketModel ticket) {
    resetTicket();

    makeTicketModel = ticket.obs;

    titleController.text = ticket.title;
    selectedCategory.value = CategoryType.values[ticket.category.id];
    selectedDate.value = ticket.ticketDate;
    selectedRating.value = ticket.rating;
    memoController.text = ticket.memo ?? "";
    locationController.text = ticket.location ?? "";
    friendController.text = ticket.friend ?? "";
    seatController.text = ticket.seat ?? "";
    priceController.text = ticket.price?.toString() ?? "";
    selectedColor.value = ColorType.values.indexWhere((element) => element.id == int.parse(ticket.color));
    isPrivate.value = ticket.isPrivate == "PRIVATE";
    selectedLayout.value = int.parse(ticket.layoutType!);
    selectedType.value = int.parse(ticket.ticketType!);

    currentIndex.value = 1;
  }

  void resetTicket() {
    makeTicketModel = TicketModel(
      id: null,
      title: "",
      imagePath: "",
      ticketDate: DateTime.now(),
      rating: 4.5,
      memo: "",
      seat: "",
      location: "",
      price: null,
      friend: "",
      color: ColorType.white.id.toString(),
      ticketType: "",
      layoutType: "",
      category: const CategoryModel(id: 0, name: ""),
    ).obs;
    imageFile.value = XFile("");
    titleController.clear();
    selectedCategory.value = CategoryType.movie;
    selectedDate.value = DateTime.now();
    selectedRating.value = 4.5;
    memoController.clear();
    locationController.clear();
    friendController.clear();
    seatController.clear();
    priceController.clear();
    selectLayoutTabIndex.value = 0;
    selectedLayout.value = 0;
    selectedType.value = 0;
  }

  Future<void> uploadTicket() async {
    isUploading.value = true;

    if (makeTicketModel.value.id != null) {
      try {
        var data = FormData.fromMap({
          'request': MultipartFile.fromString(
            jsonEncode({
              'imageUrl': makeTicketModel.value.imageUrl,
              'title': titleController.text,
              'ticketDate': DateFormat('yyyy-MM-ddTHH:mm:ss').format(selectedDate.value),
              'rating': selectedRating.value,
              'memo': memoController.text,
              'seat': seatController.text,
              'location': locationController.text,
              'price': priceController.text.isNotEmpty ? int.parse(priceController.text) : null,
              'friend': friendController.text,
              'color': ColorType.values[selectedColor.value].id,
              'categoryName': selectedCategory.value.name,
              'ticketType': selectedType.value,
              'layoutType': selectedLayout.value,
              'isPrivate': isPrivate.value ? "PRIVATE" : "PUBLIC",
            }),
            contentType: MediaType('application', 'json'),
          ),
        });

        if (imageFile.value!.path.isNotEmpty) {
          data.files.add(MapEntry(
            'image',
            await MultipartFile.fromFile(imageFile.value!.path, filename: imageFile.value!.name),
          ));
        }

        var response = await TicketsDio().patch(
          '/tickets/${makeTicketModel.value.id}',
          options: Options(
            headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'},
          ),
          data: data,
        );

        if (response.statusCode == 201) {
          await Get.find<TicketController>().getTicket();
          await Get.find<TicketController>().getMyTicket();

          Get.back();

          currentIndex.value = 3;
        }
      } on DioException catch (e) {
        print(e.response!.data);
        print(e.response!.requestOptions.data);
      } finally {
        isUploading.value = false;
      }
    } else {
      try {
        var data = FormData.fromMap({
          'image': [await MultipartFile.fromFile(imageFile.value!.path, filename: imageFile.value!.name)],
          'request': MultipartFile.fromString(
            jsonEncode({
              'title': titleController.text,
              'ticketDate': DateFormat('yyyy-MM-ddTHH:mm:ss').format(selectedDate.value),
              'rating': selectedRating.value,
              'memo': memoController.text,
              'seat': seatController.text,
              'location': locationController.text,
              'price': priceController.text.isNotEmpty ? int.parse(priceController.text) : null,
              'friend': friendController.text,
              'color': ColorType.values[selectedColor.value].id,
              'categoryName': selectedCategory.value.name,
              'ticketType': selectedType.value,
              'layoutType': selectedLayout.value,
              'isPrivate': isPrivate.value ? "PRIVATE" : "PUBLIC",
            }),
            contentType: MediaType('application', 'json'),
          ),
        });

        data.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(imageFile.value!.path, filename: imageFile.value!.name),
        ));

        var response = await TicketsDio().post(
          '/tickets',
          options: Options(
            headers: {'Content-Type': 'multipart/form-data', 'Accept': '*/*'},
          ),
          data: data,
        );

        if (response.statusCode == 201) {
          await Get.find<TicketController>().getTicket();
          await Get.find<TicketController>().getMyTicket();

          Get.back();

          currentIndex.value = 3;
        }
      } on DioException catch (e) {
        print(e.response!.data);
        print(e.response!.requestOptions.data);
      } finally {
        isUploading.value = false;
      }
    }
  }

  // Layout
  final RxInt selectLayoutTabIndex = 0.obs;

  final RxInt selectedType = 0.obs;
  final RxInt selectedLayout = 0.obs;

  void saveTicket() {
    if (titleController.text.isEmpty || (imageFile.value!.path.isEmpty && makeTicketModel.value.imageUrl == null)) {
      Fluttertoast.showToast(msg: "필수 항목을 확인해주세요!");
      return;
    }

    makeTicketModel = TicketModel(
      id: makeTicketModel.value.id,
      title: titleController.text,
      imageUrl: makeTicketModel.value.imageUrl,
      imagePath: imageFile.value?.path,
      ticketDate: selectedDate.value,
      rating: selectedRating.value,
      memo: memoController.text,
      seat: seatController.text,
      location: locationController.text,
      price: priceController.text.isNotEmpty ? int.parse(priceController.text) : null,
      friend: friendController.text,
      color: ColorType.white.id.toString(),
      ticketType: makeTicketModel.value.ticketType,
      layoutType: makeTicketModel.value.layoutType,
      category: CategoryModel(id: selectedCategory.value.index, name: selectedCategory.value.name),
    ).obs;

    currentIndex.value = 2;
  }
}
