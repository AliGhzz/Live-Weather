import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_weather/core/cubit/change_screen_cubit.dart';
import 'package:live_weather/core/widgets/background.dart';
import 'package:live_weather/core/widgets/custom_bottom_nav.dart';
import 'package:live_weather/features/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:live_weather/features/weather/presentation/screen/home_screen.dart';

class ScreenController extends StatelessWidget {
  PageController pageController ;
  ScreenController({super.key,required this.pageController});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [HomeScreen(textEditingController: textEditingController,), BookMarkScreen(pageController: pageController,textEditingController: textEditingController)];
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar:CustomBottomNav(pageController: pageController),
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
            BlocProvider.of<ChangeScreenCubit>(context).changeScreen(value);
          },
        ),
      ),
    );
  }
}
