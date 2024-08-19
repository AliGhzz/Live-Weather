import 'package:flutter/material.dart';
import 'package:live_weather/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:live_weather/features/weather/presentation/bloc/bloc/home_bloc.dart';
import 'package:live_weather/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_weather/core/widgets/screen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init locator
  await setup();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<BookmarkBloc>()),

      ],
      child: ScreenController(pageController:pageController), 
    );
  }
}
