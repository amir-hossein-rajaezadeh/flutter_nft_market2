import 'package:flutter/material.dart';
import 'package:flutter_nft_market2/models/artist_model.dart';
import 'package:flutter_nft_market2/models/nft_model.dart';
import 'package:flutter_nft_market2/shared/app_bar.dart';
import 'package:flutter_nft_market2/shared/artist_card.dart';
import 'package:flutter_nft_market2/utils/my_colors.dart';
import 'package:flutter_nft_market2/utils/my_strings.dart';

class BuyCharPage extends StatefulWidget {
  const BuyCharPage({super.key, required this.nftItem});
  final NFTModel nftItem;

  @override
  State<BuyCharPage> createState() => _BuyCharPageState();
}

class _BuyCharPageState extends State<BuyCharPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Alignment> topAnimationAlignment;
  late Animation<Alignment> bottomAnimationAlignment;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    topAnimationAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          weight: 1)
    ]).animate(
      controller,
    );

    bottomAnimationAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1)
    ]).animate(
      controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          AppBarWidget(
            showLikeIcon: true,
            nftItem: widget.nftItem,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30),
            alignment: Alignment.topLeft,
            child: const Text(
              "Buy Chart",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 66, left: 41, top: 26),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    _buildCirclePointerWidgets(
                      Colors.red,
                      "7",
                    ),
                    _buildCirclePointerWidgets(
                      Colors.amber,
                      "6",
                    ),
                    _buildCirclePointerWidgets(
                      Colors.white,
                      "5",
                    ),
                    _buildCirclePointerWidgets(),
                    _buildCirclePointerWidgets(),
                    _buildCirclePointerWidgets(),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 26),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildChartWidget(180, Colors.amber),
                      _buildChartWidget(140, Colors.white),
                      _buildChartWidget(225, Colors.red),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 195,
            width: double.infinity,
            decoration: const BoxDecoration(color: MyColors.darkBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLongDescTextWidget(Colors.amber),
                _buildLongDescTextWidget(Colors.white),
                _buildLongDescTextWidget(Colors.red),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 28, bottom: 4),
            alignment: Alignment.topLeft,
            child: const Text(
              "Featured Artist",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: artistList.length,
                itemBuilder: (context, index) {
                  final artistItem = artistList[index];
                  return Builder(
                    builder: (context) {
                      return AnimatedBuilder(
                        animation: controller,
                        builder: (context, _) {
                          return ArtistCard(
                            artistItem: artistItem,
                            controller: controller,
                            topAnimationAlignment: topAnimationAlignment.value,
                            bottomAnimationAlignment:
                                bottomAnimationAlignment.value,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildLongDescTextWidget(Color textColor) {
    return Container(
      margin: const EdgeInsets.only(top: 13, bottom: 13, right: 16),
      width: 107,
      child: Text(
        MyStrings.longDescText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }

  Container _buildChartWidget(double height, Color color) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(left: 60),
      width: 36,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );
  }

  Widget _buildCirclePointerWidgets([Color? color, String? value]) {
    bool colorIsNotNull = color != null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 1),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: colorIsNotNull
                        ? Colors.black.withOpacity(0.5)
                        : Colors.transparent,
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(1.7, 3),
                  ),
                ],
                color: color ?? Colors.transparent),
            child: Center(
              child: Text(value ?? ''),
            ),
          ),
          Expanded(
            child: Container(
              height: 2.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: MyColors.lightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
