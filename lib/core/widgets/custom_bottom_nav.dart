import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_weather/core/cubit/change_screen_cubit.dart';

class CustomBottomNav extends StatelessWidget {
  final PageController pageController;
  const CustomBottomNav(
      {super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BlocBuilder<ChangeScreenCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
              onTap: (value) {
                pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              currentIndex: state,
              selectedIconTheme: const IconThemeData(
                size: 35,
                applyTextScaling: true,
              ),
              unselectedIconTheme:
                  const IconThemeData(size: 30, applyTextScaling: true),
              selectedItemColor: const Color.fromARGB(255, 251, 5, 165),
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.transparent,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    activeIcon: Icon(Icons.home),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  activeIcon: Icon(Icons.bookmark),
                  label: 'Bookmark',
                ),
              ]);
        },
      ),
    );
  }
}
