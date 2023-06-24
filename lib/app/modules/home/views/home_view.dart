import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:visitbogor/app/customwidget/header.dart';
import 'package:visitbogor/app/data/config.dart';
import 'package:visitbogor/app/modules/home/views/home_tile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //header
            HeaderWidget(type: 1, title: appName),
            //carousel
            Expanded(
              flex: 1,
              child: Obx(() {
                if (controller.isLoading2.value) {
                  return Center(
                    child: Lottie.network(lottieLoading),
                  );
                } else {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                    itemCount: controller.popularList.length,
                    itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) =>
                        GestureDetector(
                            onTap: () {
                              controller.updateHitCount(
                                  controller.popularList[index].idWisata);
                              Get.toNamed("/detail", arguments: [
                                {"data": controller.popularList[index]}
                              ]);
                            },
                            child:
                                HomeTile(data: controller.popularList[index])),
                  );
                }
              }),
            ),
            //pembatas
            SizedBox(
              height: 10,
            ),
            //grid view
            Expanded(
              flex: 3,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: Lottie.network(lottieLoading),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: controller.wisataList.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            controller.updateHitCount(
                                controller.wisataList[index].idWisata);
                            Get.toNamed("/detail", arguments: [
                              {"data": controller.wisataList[index]}
                            ]);
                          },
                          child: HomeTile(data: controller.wisataList[index]));
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
