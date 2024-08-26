import 'package:flutter/material.dart';
import '../models/nft_model.dart';
import '../utils/my_colors.dart';

class GloryCardWidget extends StatefulWidget {
  const GloryCardWidget(
      {super.key,
      required this.controller,
      required this.topAnimationAlignment,
      required this.bottomAnimationAlignment,
      required this.nftItem});
  final AnimationController controller;
  final Alignment topAnimationAlignment;
  final Alignment bottomAnimationAlignment;
  final NFTModel nftItem;
  @override
  State<GloryCardWidget> createState() => _GloryCardWidgetState();
}

class _GloryCardWidgetState extends State<GloryCardWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4, left: 14),
          child: Text(
            widget.nftItem.nftName,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4, left: 20),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage(
                                widget.nftItem.artistInfo.artistImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: Text(
                        widget.nftItem.artistInfo.artistName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: widget.topAnimationAlignment,
                      end: widget.bottomAnimationAlignment,
                      colors: const [
                        Colors.grey,
                        MyColors.darkOrange,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.darkBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 14),
                      child: Row(
                        children: [
                          Image.asset("assets/images/icons/bitcoin.png"),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            widget.nftItem.nftPrice.toString(),
                            style: const TextStyle(
                                color: MyColors.darkOrange,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
