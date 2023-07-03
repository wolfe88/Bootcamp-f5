import 'package:explore_nearby/models/place_model.dart';
import 'package:explore_nearby/pages/PlaceInfoPage.dart';
import 'package:explore_nearby/utilities/helpers.dart';
import 'package:explore_nearby/yeni/app_layout.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class placeCard extends StatelessWidget {
  final PlaceModel placeModel;

  const placeCard({super.key,
    required this.placeModel,
    });

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return InkWell(
      onTap: (){
      },
      child: Container(
        width: size.width * 0.6,
        height: AppLayout.getHegiht(300),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 17, top: 5),
        decoration: BoxDecoration(
            color: AppColors.iconLight, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: AppLayout.getHegiht(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(Helpers.randomPictureUrl()).image, //will be changed to image path from firebaseStorage
              ),
            ),
          ),
          Gap(10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${placeModel.name}",
                  style: AppColors.headLineStyle2,
                ),
                Row(
                  children: [
                    FlutterRating(
                      rating: double.tryParse("${placeModel.rating}")!,
                      size: 15,
                    ),
                    Text(
                      "(${placeModel.rating})",
                      style: AppColors.headLineStyle2,
                    )
                  ],
                )
              ],
            ),
          ),
          Text("${placeModel.address}", style: AppColors.headLineStyle2),
        ]),
      ),
    );
  }
}
