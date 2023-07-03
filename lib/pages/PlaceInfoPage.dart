import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/place_model.dart';

class PlaceInfoPage extends StatelessWidget {
  final PlaceModel place;

  PlaceInfoPage(this.place);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(place.photo ?? ''),
            SizedBox(height: 16.0),
            Text(place.description ?? ''),
          ],
        ),
      ),
    );
  }
}

