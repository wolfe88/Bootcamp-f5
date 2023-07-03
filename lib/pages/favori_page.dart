import 'package:explore_nearby/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../widgets/fav_place_card.dart';
import '../yeni/mekan_card_detay.dart';

class FavoriPage extends StatelessWidget {
  const FavoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.favorite, color: Colors.red),
            Text(" Favori Mekanlar"),
          ]
        ),
        elevation: 2,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children:
                    mekanListesi
                        .map((denememekan) => FavoritePlaceCard(place: denememekan)).toList(),
                ),
              ],
            )
          )
      ),
    );
  }
}
