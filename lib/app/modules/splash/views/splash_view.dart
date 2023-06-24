import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:visitbogor/app/data/config.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: Lottie.network(lottieSPlash));
          } else {
            return Center(child: Lottie.network(lottieWelcome));
          }
        }));
  }
}
