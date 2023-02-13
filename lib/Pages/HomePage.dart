// ignore_for_file: prefer_const_constructors

import 'package:banaodemo/Apis/LessonsApi.dart';
import 'package:banaodemo/Apis/ProgramsApi.dart';
import 'package:banaodemo/Models/ApiResponse.dart';
import 'package:banaodemo/Models/EventModel.dart';
import 'package:banaodemo/Models/LessonModel.dart';
import 'package:banaodemo/Models/TileBtnModel.dart';
import 'package:banaodemo/Models/ProgramModel.dart';
import 'package:banaodemo/Services/CstmTheme.dart';
import 'package:banaodemo/Services/Functions.dart';
import 'package:banaodemo/Widgets/CstmAppBar.dart';
import 'package:banaodemo/Widgets/CstmBottomNavBar.dart';
import 'package:banaodemo/Widgets/EventsTileCard.dart';
import 'package:banaodemo/Widgets/LessonsTileCard.dart';
import 'package:banaodemo/Widgets/LoadingTileCard.dart';
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

  List<ProgramModel> programsForUList = [];
  List<EventModel> eventsAndExperiencesList = [];
  List<LessonModel> lessonsForUList = [];

  bool isProgramsListLoading = false;
  bool isEventsListLoading = false;
  bool isLessonsListLoading = false;

  @override
  void initState() {
    fillTileCardsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                    itemBuilder: (context, index) => isProgramsListLoading
                        ? LoadingTileCard(message: "Loading Programs")
                        : ProgramsTileCard(
                            tileCardModel: programsForUList[index],
                          ),
                    itemCount:
                        isProgramsListLoading ? 2 : programsForUList.length,
                  ),
                ),
                getCardTileTile(title: "Events and experiences"),
                SizedBox(
                  height: height * 0.47,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => isEventsListLoading
                        ? LoadingTileCard(
                            message: "Loading Events & Experiences")
                        : EventsTileCard(
                            tileCardModel: eventsAndExperiencesList[index],
                          ),
                    itemCount: isEventsListLoading
                        ? 2
                        : eventsAndExperiencesList.length,
                  ),
                ),
                getCardTileTile(title: "Lessons for you"),
                SizedBox(
                  height: height * 0.45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => isProgramsListLoading
                        ? LoadingTileCard(message: "Loading Lessons")
                        : LessonsTileCard(
                            lessonModel: lessonsForUList[index],
                          ),
                    itemCount:
                        isProgramsListLoading ? 2 : lessonsForUList.length,
                  ),
                ),
                // TileCard(tileCardModel: tileCardModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fillTileCardsList() {
    fillProgramsForUList();
    fillEventsNExpForUList();
    fillLessonsForUList();

    // programsForUList += programsForUList;
    // eventsAndExperiencesList += eventsAndExperiencesList;
    // lessonsForUList += lessonsForUList;
    // setState(() {});
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

  Future<void> fillProgramsForUList() async {
    setState(() => isProgramsListLoading = true);
    ApiResponse apiResponse = await fetchProgramsAPI();
    if (apiResponse.isSuccess()) {
      print("Api Response : ${apiResponse.response}");

      setState(() => programsForUList = apiResponse.response);
    } else {
      print("Api Error : ");
      showCstmSnackBar(
        context: context,
        msg: "${apiResponse.message} ${apiResponse.title}",
      );
    }
    // await Future.delayed(Duration(seconds: 3));
    setState(() => isProgramsListLoading = false);
  }

  Future<void> fillEventsNExpForUList() async {
    setState(() => isEventsListLoading = true);
    eventsAndExperiencesList = [
      EventModel(
        id: "1",
        category: "Babycare",
        name: "Understanding of human behaviour",
        img: "assets/images/ene1.png",
        color: Color(0xFFFFF0D3),
        createdAt: DateTime.now(),
      ),
      EventModel(
        id: "2",
        category: "Working Parents",
        name: "A complete guide for your new born baby",
        img: "assets/images/ene1.png",
        color: Color(0xFFDDE3C2),
        createdAt: DateTime.now(),
      ),
    ];
    // await Future.delayed(Duration(seconds: 5));
    // await Future.delayed(Duration(seconds: 3));
    await Future.delayed(Duration(seconds: 2));
    setState(() => isEventsListLoading = false);
  }

  Future<void> fillLessonsForUList() async {
    setState(() => isLessonsListLoading = true);
    ApiResponse apiResponse = await fetchLessonsAPI();
    if (apiResponse.isSuccess()) {
      print("Api Response : ${apiResponse.response}");

      setState(() => lessonsForUList = apiResponse.response);
    } else {
      print("Api Error : ");
      showCstmSnackBar(
        context: context,
        msg: "${apiResponse.message} ${apiResponse.title}",
      );
    }
    // await Future.delayed(Duration(seconds: 3));
    setState(() => isLessonsListLoading = false);
  }
}
