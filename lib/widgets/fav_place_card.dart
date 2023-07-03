import 'package:flutter/cupertino.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/material.dart';

 class FavoritePlaceCard extends StatelessWidget {
  final Map<dynamic, dynamic> place;
  const FavoritePlaceCard({super.key, required this.place});

    @override
    Widget build(BuildContext context) {
      return Container(
          width: 180,
          height: 180,
          margin:  const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.iconDark,
              borderRadius: BorderRadius.circular(10)),
          child:
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: (){},
             child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/${place["image"]}"),
                      ),
                    ),
                 ),

                 Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                               "${place["mekanismi"]}",
                               style: const TextStyle(
                                 color: AppColors.cardLight,
                               )
                           ),
                           ]
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "${place["uzaklık"]}",
                             style: const TextStyle(
                               color: AppColors.cardLight,
                             ),
                           ),
                         ],
                       )
                     ],
                   ),
              ]
          ),
        ),
      );
    }
  }