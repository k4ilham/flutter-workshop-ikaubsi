import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  void loadSplash() {
    isLoading(true);
    Future.delayed(const Duration(milliseconds: 5000), () {
      Get.snackbar("visitbogor", "Welcome");
      Get.toNamed("/home");
      isLoading(false);
    });
  }

  @override
  void onInit() {
    loadSplash();
    super.onInit();
  }
}
