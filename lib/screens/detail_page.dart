import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_nft_market2/models/nft_model.dart';
import 'package:flutter_nft_market2/screens/buy_chart_page.dart';
import 'package:flutter_nft_market2/shared/glory_card.dart';
import '../shared/app_bar.dart';
import '../utils/my_colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.index});
  final int index;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final List<Tab> tabList = [
    const Tab(
      child: SizedBox(
        width: 120,
        child: ImageIcon(
          AssetImage(
            "assets/images/icons/bookmark.png",
          ),
        ),
      ),
    ),
    const Tab(
        child: SizedBox(
      width: 120,
      child: ImageIcon(
        AssetImage("assets/images/icons/filter.png"),
      ),
    )),
  ];

  late final TabController _tabController =
      TabController(vsync: this, length: tabList.length);
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
    _tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NFTModel nftItem = nftList[widget.index];
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 130),
                  width: 370,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        nftItem.nftImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: const SizedBox(
                    height: 5,
                    width: 200,
                  ),
                ),
                Hero(
                  tag: "b${widget.index}",
                  child: _buildFirstWidget(nftItem),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: ClipRRect(
                    child: AppBarWidget(
                      showLikeIcon: true,
                      nftItem: nftItem,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: DefaultTabController(
              length: tabList.length,
              initialIndex: 0,
              child: TabBar(
                tabs: tabList,
                indicatorWeight: 3,
                dividerHeight: 2,
                controller: _tabController,
                indicatorColor: MyColors.lightGreen,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.fill,
                labelColor: MyColors.lightGreen,
                enableFeedback: true,
                unselectedLabelColor: Colors.white,
                labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 24),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 12, right: 35, left: 35),
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            height: 1.7,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, _) {
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 20, right: 65, left: 65),
                                height: 84,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade600.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, _) {
                                    return GloryCardWidget(
                                        nftItem: nftItem,
                                        controller: controller,
                                        topAnimationAlignment:
                                            topAnimationAlignment.value,
                                        bottomAnimationAlignment:
                                            bottomAnimationAlignment.value);
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuyCharPage(
                                        nftItem: nftItem,
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: topAnimationAlignment.value,
                                      end: bottomAnimationAlignment.value,
                                      colors: const [
                                        MyColors.primery,
                                        Colors.grey,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: MyColors.darkBlue,
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13, horizontal: 76),
                                      child: const Text(
                                        "Publish",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Center(
                      child: Text(
                    "No Filter is Available!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildFirstWidget(NFTModel nftItem) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      width: 273,
      height: 307,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.asset(
              nftItem.nftImage,
              height: 300,
              width: 273,
              fit: BoxFit.cover,
            ),
          ),
          _buildActionsEndInWidget()
        ],
      ),
    );
  }

  Container _buildActionsEndInWidget() {
    return Container(
      height: 70,
      width: 100,
      margin: const EdgeInsets.only(right: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF1E1E2E),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 7),
              child: const Text(
                "Actions\n End in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 4, right: 6, left: 6, bottom: 11),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF33334F),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      child: Text(
                        "21",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF33334F),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      child: Text(
                        "21",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF33334F),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      child: Text(
                        "21",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
