import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_weather/core/cubit/change_screen_cubit.dart';
import 'package:live_weather/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:live_weather/features/weather/data/data_source/remote/api_provider.dart';
import 'package:live_weather/features/weather/data/repository/forcast_repository_impl.dart';
import 'package:live_weather/features/weather/presentation/bloc/current_waether_bloc/home_bloc.dart';
import 'package:live_weather/features/weather/presentation/bloc/forcast/forcast_bloc.dart';
import 'package:live_weather/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_weather/core/widgets/screen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
        BlocProvider(create: (_) => ChangeScreenCubit()),
        //we can use this line because we create Forcast instance in setup()
        BlocProvider(create: (_) => locator<ForcastBloc>()),
        //if we don't create Forcast instance in setup(), we should use this line
        // BlocProvider(create: (_) => ForcastBloc(locator())),

      ],
      child: ScreenController(pageController:pageController), 
    );
  }
}













