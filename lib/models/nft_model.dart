import 'package:flutter/material.dart';
import 'artist_model.dart';

class NFTModel {
  final int id;
  final String nftName;
  final String nftImage;
  final ArtistModel artistInfo;
  final int nftPrice;
    bool isLiked;
  NFTModel(
      {required this.nftName,
      required this.nftImage,
      required this.artistInfo,
      required this.nftPrice,
      required this.isLiked,
      required this.id});
}

final List<NFTModel> nftList = [
  NFTModel(
      nftName: "Glory NFT",
      artistInfo: ArtistModel(
          artistName: "William",
          artistImage: "assets/images/artists/profile2.png",
          artistFollowers: 600,
          artistColor: Colors.transparent,
          isFowlowed: false),
      nftPrice: 29,
      nftImage: 'assets/images/nfts/nft_0.png',
      id: 0,
      isLiked: false),
  NFTModel(
      nftName: "Monkey NFT",
      artistInfo: ArtistModel(
          artistName: "Mathew",
          artistImage: "assets/images/artists/mathew.jpg",
          artistFollowers: 900,
          artistColor: Colors.transparent,
          isFowlowed: false),
      nftPrice: 29,
      nftImage: 'assets/images/nfts/monkey.jpeg',
      id: 1,
      isLiked: false),
  NFTModel(
      nftName: "Owl NFT",
      artistInfo: ArtistModel(
          artistName: "John",
          artistImage: "assets/images/artists/john.jpeg",
          artistFollowers: 600,
          artistColor: Colors.transparent,
          isFowlowed: false),
      nftPrice: 29,
      nftImage: 'assets/images/nfts/owl.jpeg',
      id: 2,
      isLiked: false),
  NFTModel(
      nftName: "Nature NFT",
      artistInfo: ArtistModel(
          artistName: "AmirHossein",
          artistImage: "assets/images/artists/my_profile.jpg",
          artistFollowers: 600,
          artistColor: Colors.transparent,
          isFowlowed: false),
      nftPrice: 29,
      nftImage: 'assets/images/nfts/nature.jpeg',
      id: 3,
      isLiked: false),
  NFTModel(
      nftName: "Tech NFT",
      artistInfo: ArtistModel(
          artistName: "Max",
          artistImage: "assets/images/artists/max.jpeg",
          artistFollowers: 600,
          artistColor: Colors.transparent,
          isFowlowed: false),
      nftPrice: 29,
      nftImage: 'assets/images/nfts/b0.png',
      id: 4,
      isLiked: false),
];
