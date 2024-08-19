import 'package:flutter/material.dart';
import 'package:live_weather/core/widgets/background.dart';
import 'package:live_weather/core/widgets/custom_bottom_nav.dart';
import 'package:live_weather/features/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:live_weather/features/weather/presentation/screen/home_screen.dart';

class ScreenController extends StatelessWidget {
  PageController pageController ;
  ScreenController({super.key,required this.pageController});

  TextEditingController textEditingController = TextEditingController();
  ValueNotifier<int> bottomNavigationBarIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeScreen(textEditingController: textEditingController,), BookMarkScreen(pageController: pageController,textEditingController: textEditingController)];
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:CustomBottomNav(pageController: pageController,index: bottomNavigationBarIndex,),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: DayNightImage.getBackGroundImage(), fit: BoxFit.cover)),
          height: height,
          child: PageView(
            controller: pageController,
            children: screens,
            onPageChanged: (value) {
              bottomNavigationBarIndex.value =value;
            },
          ),
        ),
      ),
    );
  }
}
