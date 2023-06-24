import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:visitbogor/app/customwidget/header.dart';
import 'package:visitbogor/app/data/config.dart';
import 'package:visitbogor/app/data/wisata_model.dart';
import '../controllers/detail_controller.dart';
import 'package:jiffy/jiffy.dart';

// ignore: must_be_immutable
class DetailView extends GetView<DetailController> {
  WisataModel data = Get.arguments[0]['data'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  //padding: EdgeInsets.all(16),
                  height: double.infinity,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: data.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Lottie.network(lottieLoading),
                    errorWidget: (context, url, error) =>
                        Lottie.network(lottieError),
                  ),
                ),
                Positioned(
                    top: 5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.toNamed("/home");
                      },
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                HeaderWidget(type: 2, title: data.title),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'avenir',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Upload by :" +
                                data.userCreate.toLowerCase() +
                                ", " +
                                Jiffy(data.createdAt, "yyyy-MM-dd").fromNow()),
                        TextSpan(text: "\n \n" + data.summary),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
