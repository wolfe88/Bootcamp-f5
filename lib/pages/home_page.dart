import 'package:explore_nearby/pages/search_page.dart';
import 'package:explore_nearby/theme.dart';
import 'package:explore_nearby/yeni/mekan_card_detay.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utilities/helpers.dart';
import '../widgets/avatar.dart';
import '../widgets/mekan.card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      child: _Stories(),
      padding: EdgeInsets.all(8),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text("Ankara", style: AppColors.headLineStyle1),
                              Icon(
                                Icons.location_on,
                                color: AppColors.textDark,
                              ),
                            ],
                          ),
                          Gap(5),
                          Text(
                            "Sana en yakın yerleri keşfetmeye hazır mısın?",
                            style: AppColors.headLineStyle2,
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Avatar.small(url: Helpers.randomPictureUrl()),
                        onPressed: () {},
                        splashRadius: 24,
                      ),
                    ],
                  ),
                  Gap(25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.iconLight,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: AppColors.iconDark,
                          ),
                          Text(
                            "Arama Yapın!",
                            style: AppColors.textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Populer Yerler",
                        style: AppColors.headLineStyle3,
                      ),
                      InkWell(
                        onTap: () {
                          print("tıklandı");
                        },
                        child: Text(
                          "Hepsini gör",
                          style: AppColors.headLineStyle2,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: mekanListesi
                          .map((denememekan) => mekanCard(mekan: denememekan))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
