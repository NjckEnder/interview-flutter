import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/source/config/theme.dart';
import 'package:mobile/source/story_model.dart';
import 'package:mobile/source/widgets/app_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Random random = Random();
  StoryModel? selecStory;
  late List<StoryModel> listStory;

  @override
  void initState() {
    // TODO: implement initState
    getListStoryFromLocal().then((value) {
      listStory = value;
      randomStory();
    });
    super.initState();
  }

  Future<void> randomStory() async {
    listStory = listStory.where((element) => element.vote == null).toList();
    setState(() {});
    if (listStory.isNotEmpty) {
      int randomIndex = random.nextInt(listStory.length);
      selecStory = listStory[randomIndex];
      setState(() {});
    } else {
      showEmptyDialog();
    }
  }

  void onPressedButton({bool? vote}) async {
    // selecStory?.vote = true;
    selecStory = selecStory?.copyWith(vote: vote);
    final index =
        listStory.indexWhere((element) => element.id == selecStory?.id);
    listStory[index] = selecStory!;
    print('${listStory[index].toJson()}');
    await saveVoteListStory().then((value) => randomStory());
  }

  void showEmptyDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const AppText.bodyLarge(text: 'Message'),
            content: const AppText.bodyMedium(
                text: "That's all the jokes for today! Come back another day!"),
            actions: [
              Center(
                child: AppButton.min(
                  title: 'OK',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }

  Future<void> saveVoteListStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonList = listStory.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString('listStory', jsonString);
  }

  Future<List<StoryModel>> getListStoryFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('listStory');
    if (jsonString == null) return StoryModel.lstData;
    final jsonList = jsonDecode(jsonString) as List;
    final stories = jsonList.map((e) => StoryModel.fromJson(e)).toList();
    return stories.where((element) => element.vote == null).toList();
    // return stories;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/logo.png'),
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                AppText.bodyMedium(
                  text: 'Handicrafted by',
                  color: ThemeColors.textColor5,
                ),
                AppText.bodyLarge(
                  text: 'Jim HLS',
                  color: ThemeColors.textColor3,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(child: Image.asset('assets/icon.jpg')),
            ),
          ],
        ),
        body: (selecStory != null && listStory.isNotEmpty)
            ? Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: height,
                          width: width,
                          child: DecoratedBox(
                            decoration:
                                const BoxDecoration(color: Color(0xff29B363)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 18),
                                  child: AppText.titleMedium(
                                    text: 'A joke a day keeps the doctor away',
                                    color: ThemeColors.textColor1,
                                  ),
                                ),
                                AppText.bodyMedium(
                                  text:
                                      'If you joke wrong way, your teeth have to pay. (Serious)',
                                  color: ThemeColors.textColor1,
                                )
                              ],
                            ),
                          ))),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AppText.bodyMedium(
                                    text: selecStory?.story ?? '',
                                    color: ThemeColors.textColor4,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AppButton.min(
                                        title: 'This is Funny!',
                                        onPressed: () =>
                                            onPressedButton(vote: true),
                                        color: const Color(0xff2C7EDB),
                                      ),
                                      AppButton.min(
                                        title: 'this is not Funny.',
                                        onPressed: () =>
                                            onPressedButton(vote: false),
                                        color: const Color(0xff29B363),
                                      ),
                                    ],
                                  ),
                                ),
                                // Expanded(child: Divider(height: height, color: Colors.black,)),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: height,
                          width: width,
                          child: DecoratedBox(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      height: 1,
                                      width: width,
                                      color: const Color(0xffEDEDED),
                                    ),
                                  ),
                                  const AppText.bodySmall(
                                    text:
                                        'This appis created as part of part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsobility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arice from reliance on the information contained on this site.',
                                    color: ThemeColors.textColor5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AppText.bodyMedium(
                                      text: 'Copyright 2021 HLS',
                                      color: ThemeColors.textColor4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )))
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
