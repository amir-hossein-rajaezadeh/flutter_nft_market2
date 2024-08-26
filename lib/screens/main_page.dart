import 'package:flutter/material.dart';
import 'package:flutter_nft_market2/models/artist_model.dart';
import 'package:flutter_nft_market2/models/bids_model.dart';
import 'package:flutter_nft_market2/shared/app_bar.dart';
import 'package:flutter_nft_market2/shared/artist_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/nft_model.dart';
import '../shared/glory_card.dart';
import '../utils/my_colors.dart';
import 'detail_page.dart';

List<String> imageList = [
  "assets/images/0.png",
  "assets/images/1.png",
  "assets/images/2.png",
  "assets/images/3.png",
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Alignment> topAnimationAlignment;
  late Animation<Alignment> bottomAnimationAlignment;
  final PageController _pageController = PageController();
  int _activePage = 0;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          const AppBarWidget(
            showLikeIcon: false,
          ),
          Container(
            width: 290,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: MyColors.primery),
            ),
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 240,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.only(top: 4),
                      hintText: "search artworks",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 2,
                        height: 18,
                        color: Colors.grey,
                      ),
                      const Icon(
                        Icons.mic_none_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 31.h, left: 30),
            alignment: Alignment.topLeft,
            child: const Text(
              "Populer Bids",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 360,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 16.h),
            height: 71.h,
            child: ListView.separated(
              itemCount: populerBidsModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      PopulerBidsModel item = populerBidsModel[index];
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: topAnimationAlignment.value,
                              end: bottomAnimationAlignment.value,
                              colors: item.gradiantList),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 55,
                        height: 71.h,
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Container(
                              decoration: BoxDecoration(
                                color: MyColors.darkBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.rate.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 7.h, bottom: 7.h),
                                    width: 10.w,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Text(
                                    "100",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                        ),
                      );
                    });
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: 20,
                );
              },
            ),
          ),
          ClipRect(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(_activePage - 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, right: 2),
                      child: Image.asset("assets/images/icons/arrow_left.png"),
                    ),
                  ),

                  Container(
                    width: 340,
                    height: 200,
                    margin:
                        const EdgeInsets.only(bottom: 35, right: 10, left: 10),
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) => setState(() {
                        _activePage = value;
                      }),
                      itemCount: nftList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = nftList[index];
                        return Hero(
                          tag: "b$index",
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => DetailPage(
                                    index: index,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 820),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                              // await Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (ctx) => DetailPage(
                              //       nftItem: item,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              decoration: const BoxDecoration(),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                          image: AssetImage(item.nftImage),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey.shade500.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: AnimatedBuilder(
                                      animation: controller,
                                      builder: (context, _) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GloryCardWidget(
                                              nftItem: item,
                                              controller: controller,
                                              topAnimationAlignment:
                                                  topAnimationAlignment.value,
                                              bottomAnimationAlignment:
                                                  bottomAnimationAlignment
                                                      .value),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // if (_activePage != (nftList.length-1))
                  GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(_activePage + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 2),
                      child: Image.asset("assets/images/icons/arrow_right.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 71.h,
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 27.w : 18.w),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          imageList[index],
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 71.w,
                  height: 65.h,
                );
              },
              itemCount: imageList.length,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 28, left: 28, right: 28),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Artist",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "see all",
                  style: TextStyle(
                      color: MyColors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              ArtistModel artistItem = artistList.first;
              return ArtistCard(
                  artistItem: artistItem,
                  controller: controller,
                  topAnimationAlignment: topAnimationAlignment.value,
                  bottomAnimationAlignment: bottomAnimationAlignment.value);
            },
          ),
        ],
      ),
    );
  }
}
