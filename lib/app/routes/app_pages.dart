import 'package:get/get.dart';

import 'package:visitbogor/app/modules/detail/bindings/detail_binding.dart';
import 'package:visitbogor/app/modules/detail/views/detail_view.dart';
import 'package:visitbogor/app/modules/home/bindings/home_binding.dart';
import 'package:visitbogor/app/modules/home/views/home_view.dart';
import 'package:visitbogor/app/modules/splash/bindings/splash_binding.dart';
import 'package:visitbogor/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
