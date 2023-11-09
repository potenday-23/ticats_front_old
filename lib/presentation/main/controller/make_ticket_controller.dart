import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tickets/presentation/main/data/enum/category.dart';
import 'package:tickets/presentation/main/view/select_ticket_layout_screen.dart';

import '../data/model/category_model.dart';
import '../data/model/ticket_model.dart';
import '../view/my_ticket_screen.dart';
import '../view/register_ticket_screen.dart';

class MakeTicketController extends GetxController {
  // Screen Control
  final List<Widget> screens = [
    MyTicketScreen(),
    RegisterTicketScreen(),
    SelectTicketLayoutScreen(),
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
    ticketType: "",
    layoutType: "",
    category: CategoryModel(id: 0, name: ""),
  ).obs;

  final Rx<XFile?> imageFile = XFile("").obs;
  final TextEditingController titleController = TextEditingController();
  final Rx<CategoryType> selectedCategory = CategoryType.movie.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxDouble selectedRating = 4.5.obs;
  final TextEditingController memoController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController friendController = TextEditingController();
  final TextEditingController seatController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();

    imageFile.value = await picker.pickImage(source: ImageSource.gallery);
  }

  void resetTicket() {
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
    selectedType.value = 0;
  }

  // Layout
  final RxInt selectLayoutTabIndex = 0.obs;

  final RxInt selectedType = 0.obs;
  final RxInt selectedLayout = 0.obs;

  void saveTicket() {
    if (titleController.text.isEmpty || imageFile.value!.path.isEmpty) {
      Fluttertoast.showToast(msg: "필수 항목을 확인해주세요!");
      return;
    }

    makeTicketModel = TicketModel(
      id: null,
      title: titleController.text,
      imagePath: imageFile.value!.path,
      ticketDate: selectedDate.value,
      rating: selectedRating.value,
      memo: memoController.text,
      seat: seatController.text,
      location: locationController.text,
      price: priceController.text.isNotEmpty ? int.parse(priceController.text) : null,
      friend: friendController.text,
      ticketType: "",
      layoutType: "",
      category: CategoryModel(id: selectedCategory.value.index, name: selectedCategory.value.name),
    ).obs;

    currentIndex.value = 2;
  }
}
