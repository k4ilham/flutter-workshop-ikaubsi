import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visitbogor/app/data/config.dart';
import 'package:visitbogor/app/data/wisata_model.dart';

// ignore: must_be_immutable
class HomeTile extends StatelessWidget {
  WisataModel data;
  HomeTile({required this.data});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: CachedNetworkImage(
                imageUrl: data.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Lottie.network(lottieLoading),
                errorWidget: (context, url, error) =>
                    Lottie.network(lottieError),
              ),
            ),
            Positioned(
              right: 5,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                    Text(
                      data.hitCount,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  data.title,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
