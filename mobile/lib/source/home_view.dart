import 'package:flutter/material.dart';
import 'package:mobile/source/config/theme.dart';
import 'package:mobile/source/story_model.dart';
import 'package:mobile/source/widgets/app_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final storyListData = StoryModel.lstData;
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
      body: Column(children: [
        Expanded(
            flex: 1,
            child: SizedBox(
                height: hight,
                width: width,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green.shade600),
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
                  children: [
                    AppText.bodyMedium(
                      text: 'testing',
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton.min(title: 'title', onPressed: (){},),
                        AppButton.min(title: 'title', onPressed: (){}, color: Colors.green,),
                      ],
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
                    decoration: BoxDecoration(color: Colors.green))))
      ]),
    );
  }
}
