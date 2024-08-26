import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class ArtistModel {
  final String artistName;
  final String artistImage;
  final int artistFollowers;
  final Color artistColor;
    bool isFowlowed;
  ArtistModel(
      {required this.artistName,
      required this.artistImage,
      required this.artistFollowers,
      required this.artistColor,
      required this.isFowlowed});
}

List<ArtistModel> artistList = [
  ArtistModel(
      artistName: "AmirHossein Rajaee",
      artistImage: "assets/images/artists/my_profile.jpg",
      artistFollowers: 900,
      artistColor: MyColors.darkBlue,
      isFowlowed: false),
  ArtistModel(
      artistName: "Mathew Fame",
      artistImage: "assets/images/artists/mathew.jpg",
      artistFollowers: 876,
      artistColor: MyColors.orange,
      isFowlowed: false),
  ArtistModel(
      artistName: "Anna Merlin",
      artistImage: "assets/images/artists/anna.png",
      artistFollowers: 876,
      artistColor: Colors.white,
      isFowlowed: false),
  ArtistModel(
      artistName: "Sadie Sinke",
      artistImage: "assets/images/artists/max.jpeg",
      artistFollowers: 774,
      artistColor: const Color.fromARGB(255, 213, 106, 0),
      isFowlowed: false),
  ArtistModel(
      artistName: "John Smith",
      artistImage: "assets/images/artists/john.jpeg",
      artistFollowers: 876,
      artistColor: const Color.fromARGB(255, 74, 45, 34),
      isFowlowed: false),
];
