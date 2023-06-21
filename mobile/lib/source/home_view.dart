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
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(
            Icons.person_2_outlined,
            color: ThemeColors.textColor3,
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                AppText.bodyMedium(
                  text: 'Handicrafted by',
                  color: ThemeColors.textColor2,
                ),
                AppText.bodyMedium(
                  text: 'Jim HLS',
                  color: ThemeColors.textColor4,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Icon(
                  Icons.person_3_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: (selecStory != null && listStory.isNotEmpty)
            ? Column(children: [
                Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: hight,
                        width: width,
                        child: DecoratedBox(
                          decoration:
                              BoxDecoration(color: Colors.green.shade600),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              AppText.titleLarge(
                                text: 'A joke a day keeps the doctor away',
                                color: ThemeColors.textColor1,
                              ),
                              AppText.bodyLarge(
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
                      height: hight,
                      width: width,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 30),
                                child: AppText.bodyMedium(
                                  text: selecStory?.story ?? '',
                                  // text: listStory.toString(),
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                ),
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
                                  ),
                                  AppButton.min(
                                    title: 'this is not Funny.',
                                    onPressed: () =>
                                        onPressedButton(vote: false),
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: hight,
                        width: width,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(color: Colors.blue),
                          child: AppText.headlineLarge(
                            text: 'Testing',
                            color: ThemeColors.textColor1,
                          ),
                        )))
              ])
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
