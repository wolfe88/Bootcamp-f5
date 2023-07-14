import 'package:explore_nearby/yeni/app_layout.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class mekanCard extends StatelessWidget {
  final Map<dynamic, dynamic> mekan;
  const mekanCard({super.key, required this.mekan});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHegiht(300),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
          color: AppColors.iconLight, borderRadius: BorderRadius.circular(24)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
          onTap: () {
            detayEkrani(context);
          },
          child: Container(
            height: AppLayout.getHegiht(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${mekan["image"]}"),
              ),
            ),
          ),
        ),
        Gap(10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${mekan["mekanismi"]}",
                style: AppColors.headLineStyle2,
              ),
              Row(
                children: [
                  FlutterRating(
                    rating: double.tryParse(mekan["degerlendirme"])!,
                    size: 15,
                  ),
                  Text(
                    "(${mekan["degerlendirme"]})",
                    style: AppColors.headLineStyle2,
                  )
                ],
              )
            ],
          ),
        ),
        Text("${mekan["adres"]}", style: AppColors.headLineStyle2),
      ]),
    );
  }

  Future<dynamic> detayEkrani(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          backgroundColor: AppColors.iconLight,
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/${mekan["image"]}",
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                ),
                Gap(5),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    mekan["mekanismi"],
                    style: AppColors.headLineStyle1,
                  ),
                ),
                Gap(5),
                Text(
                  mekan["açıklama"],
                  style: AppColors.headLineStyle2,
                ),
                Text("Değerlendirme: ${mekan["degerlendirme"]},",
                    style: AppColors.headLineStyle2),
                Text("Adres: ${mekan["adres"]}",
                    style: AppColors.headLineStyle2),
                Text("Uzaklık: ${mekan["uzaklık"]}",
                    style: AppColors.headLineStyle2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
