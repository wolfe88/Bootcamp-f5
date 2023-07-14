import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme.dart';
import '../yeni/app_layout.dart';

class mekanDetayCard extends StatelessWidget {
  final Map<dynamic, dynamic> mekan;
  const mekanDetayCard({super.key, required this.mekan});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return GestureDetector(
      onTap: () {
        detayEkrani(context);
      },
      child: Container(
        width: double.infinity,
        height: AppLayout.getHegiht(85),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(right: 17, top: 5),
        decoration: BoxDecoration(
            color: AppColors.iconLight,
            borderRadius: BorderRadius.circular(24)),
        child: Row(children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            height: AppLayout.getHegiht(65),
            width: AppLayout.getWidht(80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${mekan["image"]}"),
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            "${mekan["mekanismi"]}",
            style: AppColors.headLineStyle3,
          ),
        ]),
      ),
    );
  }

  Future<dynamic> detayEkrani(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
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
                  Navigator.of(context).pop(); // Dialog kapatılıyor
                },
              ),
            ],
          );
        },
      );
  }
}
