import 'package:flutter/material.dart';

class PopulerBidsModel {
  final int rate;
  final List<Color> gradiantList;

  PopulerBidsModel({
    required this.rate,
    required this.gradiantList,
  });
}

List<PopulerBidsModel> populerBidsModel = [
  PopulerBidsModel(
    rate: 45,
    gradiantList: [
      Colors.grey,
      const Color(0xFFED2D2D),
    ],
  ),
  PopulerBidsModel(
    rate: 33,
    gradiantList: [
      Colors.grey,
      const Color(0xFF5FEEE5),
    ],
  ),
  PopulerBidsModel(
    rate: 29,
    gradiantList: [
      Colors.grey,
      const Color(0xFF0F6BF5),
    ],
  ),
  PopulerBidsModel(
    rate: 65,
    gradiantList: [
      Colors.grey,
      const Color.fromARGB(255, 222, 237, 13),
    ],
  ),
  PopulerBidsModel(
    rate: 78,
    gradiantList: [
      Colors.grey,
      const Color(0xFFE723B0),
    ],
  ),
];
