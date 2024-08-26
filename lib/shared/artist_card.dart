import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/artist_model.dart';
import '../utils/my_colors.dart';

class ArtistCard extends StatefulWidget {
  const ArtistCard({
    super.key,
    required this.artistItem,
    required this.controller,
    required this.topAnimationAlignment,
    required this.bottomAnimationAlignment,
  });
  final AnimationController controller;
  final Alignment topAnimationAlignment;
  final Alignment bottomAnimationAlignment;
  final ArtistModel artistItem;

  @override
  State<ArtistCard> createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  bool showFollowAnim = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 55, left: 57, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: widget.topAnimationAlignment,
          end: widget.bottomAnimationAlignment,
          colors: [Colors.grey, widget.artistItem.artistColor],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyColors.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, right: 8, bottom: 10, left: 10),
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(widget.artistItem.artistImage),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.artistItem.artistName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.artistItem.artistFollowers}k Followers",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                showFollowAnim = true;
                                widget.artistItem.isFowlowed
                                    ? widget.artistItem.isFowlowed = false
                                    : widget.artistItem.isFowlowed = true;
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: widget.topAnimationAlignment,
                                end: widget.bottomAnimationAlignment,
                                colors: const [
                                  MyColors.primery,
                                  Colors.grey,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: MyColors.darkBlue,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 22),
                                child: Text(
                                  widget.artistItem.isFowlowed
                                      ? "Followed"
                                      : "Follow",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.artistItem.isFowlowed)
                          SizedBox(
                            height: showFollowAnim ? 75 : 0,
                            width: 100,
                            child: Lottie.asset(
                              "assets/animations/congrats.json",
                              repeat: false,
                              fit: BoxFit.cover,
                              onLoaded: (p0) async {
                                await Future.delayed(
                                  const Duration(seconds: 5),
                                );
                                setState(() {
                                  showFollowAnim = false;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
