import 'package:explore_nearby/theme.dart';
import 'package:explore_nearby/widgets/mekan_detay_card.dart';
import 'package:explore_nearby/yeni/mekan_genel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/mekan_card.dart';
import '../yeni/mekan_card_detay.dart';

class MekanDetayPage extends StatelessWidget {
  const MekanDetayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text(
            " Mekanlar",
            style: AppColors.headLineStyle3,
          ),
        ]),
        elevation: 2,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Gap(10),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: mekanListesi
                  .map((denememekan) => mekanDetayCard(mekan: denememekan))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
