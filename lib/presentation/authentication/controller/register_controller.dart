import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterController extends GetxController {
  bool get isAllAgree => isAgree1.value && isAgree2.value && isAgree3.value && isAgree4.value;
  bool get isRequiredAgree => isAgree1.value && isAgree2.value;

  RxBool isAgree1 = false.obs;
  RxBool isAgree2 = false.obs;
  RxBool isAgree3 = false.obs;
  RxBool isAgree4 = false.obs;

  void setAllAgree() {
    if (!isAllAgree) {
      isAgree1.value = true;
      isAgree2.value = true;
      isAgree3.value = true;
      isAgree4.value = true;
    } else {
      isAgree1.value = false;
      isAgree2.value = false;
      isAgree3.value = false;
      isAgree4.value = false;
    }
  }

  Future<bool> requestGalleryPermission() async {
    await Permission.photos.request();

    return await Permission.photos.isGranted;
  }
}
