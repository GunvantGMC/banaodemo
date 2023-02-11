// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Models/TileBtnModel.dart';
import 'package:banaodemo/Models/TileCardMode.dart';
import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:banaodemo/Widgets/CstmAppBar.dart';
import 'package:banaodemo/Widgets/CstmBottomNavBar.dart';
import 'package:banaodemo/Widgets/EventsTileCard.dart';
import 'package:banaodemo/Widgets/LessonsTileCard.dart';
import 'package:banaodemo/Widgets/TileBtn.dart';
import 'package:banaodemo/Widgets/ProgramsTileCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileBtnModel> tileBtnList = [
    TileBtnModel(title: "Programs", img: "assets/images/programs.png"),
    TileBtnModel(title: "Get help", img: "assets/images/help.png"),
    TileBtnModel(title: "Learn", img: "assets/images/learn.png"),
    TileBtnModel(title: "DD Tracker", img: "assets/images/dd_tracker.png"),
  ];

  List<TileCardModel> programsForUList = [];
  List<TileCardModel> eventsAndExperiencesList = [];
  List<TileCardModel> lessonsForUList = [];

  @override
  void initState() {
    fillTileCardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CstmTheme.accentColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CstmAppBar(),
      ),
      bottomNavigationBar: CstmBottomNavBar(),
      // ignore: prefer_const_literals_to_create_immutables
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello, Priya!",
                style: cstmTxtStyle(
                  ff: "Lora",
                  fs: 20.0,
                  fc: CstmTheme.greydarkestColor,
                  fw: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                "What do you wanna learn today?",
                style: cstmTxtStyle(
                  fs: 12.0,
                  fc: CstmTheme.ternaryColor,
                  fw: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2.5),
                itemBuilder: (context, index) =>
                    TileBtn(tileBtn: tileBtnList[index]),
                itemCount: tileBtnList.length,
              ),
              getCardTileTile(title: "Programs for you"),
              SizedBox(
                height: height * 0.45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProgramsTileCard(
                    tileCardModel: programsForUList[index],
                  ),
                  itemCount: programsForUList.length,
                ),
              ),
              getCardTileTile(title: "Events and experiences"),
              SizedBox(
                height: height * 0.47,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => EventsTileCard(
                    tileCardModel: eventsAndExperiencesList[index],
                  ),
                  itemCount: eventsAndExperiencesList.length,
                ),
              ),
              getCardTileTile(title: "Lessons for you"),
              SizedBox(
                height: height * 0.45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => LessonsTileCard(
                    tileCardModel: lessonsForUList[index],
                  ),
                  itemCount: lessonsForUList.length,
                ),
              ),
              // TileCard(tileCardModel: tileCardModel),
            ],
          ),
        ),
      ),
    );
  }

  void fillTileCardList() {
    programsForUList = [
      TileCardModel(
        title: "Lifestyle",
        desc: "Understanding of human behaviour",
        img: "assets/images/pfu2.png",
        color: Color(0xFFFFF0D3),
        totLessons: "12",
      ),
      TileCardModel(
        title: "Working Parents",
        desc: "A complete guide for your new born baby",
        img: "assets/images/pfu1.png",
        color: Color(0xFFDDE3C2),
        totLessons: "16",
      ),
    ];
    eventsAndExperiencesList = [
      TileCardModel(
        title: "Babycare",
        desc: "Understanding of human behaviour",
        img: "assets/images/ene1.png",
        color: Color(0xFFFFF0D3),
        totLessons: "13 Feb, Sunday",
      ),
      TileCardModel(
        title: "Working Parents",
        desc: "A complete guide for your new born baby",
        img: "assets/images/ene1.png",
        color: Color(0xFFDDE3C2),
        totLessons: "13 Feb, Sunday",
      ),
    ];
    lessonsForUList = [
      TileCardModel(
        title: "Babycare",
        desc: "Understanding of human behaviour",
        img: "assets/images/ene1.png",
        color: Color(0xFFFFF0D3),
        totLessons: "3 min",
      ),
      TileCardModel(
        title: "Working Parents",
        desc: "A complete guide for your new born baby",
        img: "assets/images/ene1.png",
        color: Color(0xFFDDE3C2),
        totLessons: "3 min",
      ),
    ];
    programsForUList += programsForUList;
    eventsAndExperiencesList += eventsAndExperiencesList;
    lessonsForUList += lessonsForUList;
    setState(() {});
  }

  getCardTileTile({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: cstmTxtStyle(
              ff: "Lora",
              fs: 16,
              fc: CstmTheme.blackColor,
              fw: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () => showCstmSnackBar(
              context: context,
              msg: "Under Development",
            ),
            child: Wrap(
              children: [
                Text(
                  "View all",
                  style: cstmTxtStyle(
                    ff: "Lora",
                    fs: 16,
                    fc: CstmTheme.ternaryColor,
                    fw: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: CstmTheme.ternaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
