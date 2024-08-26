import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/nft_model.dart';
import '../utils/my_colors.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key, required this.showLikeIcon, this.nftItem});

  final bool showLikeIcon;
  final NFTModel? nftItem;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool showLikeAnim = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 0, right: 0, left: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.showLikeIcon)
            Container(
              margin: const EdgeInsets.only(top: 35),
              height: 100,
              child: GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(top: 60),
              height: 37,
              width: 60,
              decoration: BoxDecoration(
                color: MyColors.darkBlue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(right: 26, top: showLikeAnim ? 60 : 30),
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: widget.showLikeIcon
                      ? null
                      : const DecorationImage(
                          image: AssetImage(
                            "assets/images/artists/my_profile.jpg",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                ),
                child: widget.showLikeIcon
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.nftItem!.isLiked) {
                              widget.nftItem!.isLiked = false;
                            } else {
                              showLikeAnim = true;
                              widget.nftItem!.isLiked = true;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: widget.nftItem!.isLiked
                                      ? MyColors.lightPink
                                      : Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: Colors.green.shade300,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
              ),
              if (widget.nftItem?.isLiked ?? false)
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  alignment: Alignment.topRight,
                  height: showLikeAnim ? 100 : 0,
                  width: 100,
                  child: Lottie.asset("assets/animations/like.json",
                      onLoaded: (p0) async {
                    await Future.delayed(
                      const Duration(seconds: 2),
                    );
                    setState(() {
                      showLikeAnim = false;
                    });
                  }, repeat: false),
                )
            ],
          ),
        ],
      ),
    ); 
  }
}
