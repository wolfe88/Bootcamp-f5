import 'package:explore_nearby/theme.dart';
import 'package:explore_nearby/yeni/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isContainer1Pressed = false;
  bool isContainer2Pressed = false;
  bool isContainer3Pressed = false;
  bool isContainer4Pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidht(20),
          vertical: AppLayout.getHegiht(20),
        ),
        children: [
          Gap(AppLayout.getHegiht(40)),
          Text(
            "Ne\narıyorsunuz?",
            style: AppColors.headLineStyle1.copyWith(
              fontSize: AppLayout.getWidht(35),
              color: Colors.black,
            ),
          ),
          Gap(AppLayout.getHegiht(20)),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isContainer1Pressed = !isContainer1Pressed;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Tarihi Yerler",
                      style: AppColors.headLineStyle2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHegiht(50)),
                      color: isContainer1Pressed
                          ? Colors.blue
                          : AppColors.iconLight
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isContainer2Pressed = !isContainer2Pressed;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Parklar",
                      style: AppColors.headLineStyle2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHegiht(50)),
                      color: isContainer2Pressed
                          ? Colors.blue
                          : AppColors.iconLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(AppLayout.getHegiht(10)),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isContainer3Pressed = !isContainer3Pressed;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Doğal Alanlar",
                      style: AppColors.headLineStyle2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHegiht(50)),
                      color: isContainer3Pressed
                          ? Colors.blue
                          : AppColors.iconLight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isContainer4Pressed = !isContainer4Pressed;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Müzeler",
                      style: AppColors.headLineStyle2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppLayout.getHegiht(50)),
                      color: isContainer4Pressed
                          ? Colors.blue
                          : AppColors.iconLight,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
