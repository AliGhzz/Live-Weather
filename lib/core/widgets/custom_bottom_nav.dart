import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  PageController pageController;
  ValueNotifier<int> index ;
  CustomBottomNav({super.key, required this.pageController,required this.index});


  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();

  

}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height:60,
      child: ValueListenableBuilder(
        valueListenable:widget.index,
        builder: (context, value, child) {
          return BottomNavigationBar(
            onTap: (value) {
              setState(() {
                
              });
              widget.pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.linear);
            },
            currentIndex: widget.index.value,
            selectedIconTheme: const IconThemeData(
              size: 25,
              applyTextScaling:true, 
            ),
            unselectedIconTheme: const IconThemeData(
              size: 23,
              applyTextScaling:true
            ),
            selectedItemColor: const Color.fromARGB(255, 251, 5, 165),
            backgroundColor: const Color.fromARGB(255, 248, 203, 66),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,),
                activeIcon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), 
                activeIcon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
            ]
          );
        },
      ),
    );
  }
}
