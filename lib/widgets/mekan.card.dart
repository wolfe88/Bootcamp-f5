import 'package:explore_nearby/yeni/app_layout.dart';
import 'package:explore_nearby/theme.dart';
import 'package:flutter/cupertino.dart';
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
        Container(
          height: AppLayout.getHegiht(180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/${mekan["image"]}"),
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
}
