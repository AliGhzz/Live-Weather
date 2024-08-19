import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_weather/core/utils/time_formatter.dart';
import 'package:live_weather/core/widgets/loading.dart';
import 'package:live_weather/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:live_weather/features/weather/domain/use_case/get_suggestion_city_usecase.dart';
import 'package:live_weather/features/weather_icon.dart';
import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';
import 'package:live_weather/features/weather/presentation/bloc/bloc/cw_status.dart';
import 'package:live_weather/features/weather/presentation/bloc/bloc/home_bloc.dart';
import 'package:live_weather/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/bookmark_icon.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatefulWidget {
  TextEditingController textEditingController;
  HomeScreen({super.key, required this.textEditingController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  PageController pageController = PageController(initialPage: 0);

  GetSuggestionCityUseCase getSuggestionCityUseCase =
      GetSuggestionCityUseCase(locator());

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    fetch() async {
      prefs = await SharedPreferences.getInstance();
      String city = prefs.getString('city') ?? 'tehran';
      print("object1 $city");
      BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(city));
      print("object2 $city");
    }

    fetch();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            width: width,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: width - 70,
                      child: TextField(
                        onSubmitted: (String prefix) {
                          widget.textEditingController.text = ''; 
                          BlocProvider.of<HomeBloc>(context)
                              .add(LoadCwEvent(prefix));
                        },
                        controller: widget.textEditingController,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                        onChanged: (value) {
                          print("onChanged");
                          getSuggestionCityUseCase(value);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          hintText: "Enter a City...",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) {
                        if (previous.cwStatus == current.cwStatus) {
                          return false;
                        }
                        return true;
                      }, builder: (context, state) {
                        /// show Loading State for Cw
                        if (state.cwStatus is CwLoading) {
                          return const SizedBox.shrink();
                        }
          
                        /// show Error State for Cw
                        if (state.cwStatus is CwError) {
                          return IconButton(
                            onPressed: () {
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content: Text("please load a city!"),
                              //   behavior: SnackBarBehavior.floating, // Add this line
                              // ));
                            },
                            icon: const Icon(Icons.error,
                                color: Colors.white, size: 35),
                          );
                        }
          
                        if (state.cwStatus is CwCompleted) {
                          final CwCompleted cwComplete =
                              state.cwStatus as CwCompleted;
                          BlocProvider.of<BookmarkBloc>(context).add(
                              GetCityByNameEvent(
                                  cwComplete.currentWeatherEntity.name!));
                          fetch() async {
                            print("object3 ${widget.textEditingController.text}");
                            await prefs.setString(
                                "city", cwComplete.currentWeatherEntity.name!);
                            print("object4 ${widget.textEditingController.text}");
                          }
          
                          fetch();
                          return BookMarkIcon(
                              name: cwComplete.currentWeatherEntity.name!);
                        }
          
                        return Container();
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.cwStatus is CwLoading) {
                return Loading(name: "halfTriangleDot");
              } else if (state.cwStatus is CwCompleted) {
                final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
                final CurrentWeatherEntity currentWeatherEntity =
                    cwCompleted.currentWeatherEntity;
                return Expanded(
                    child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          currentWeatherEntity.name!.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 3,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          currentWeatherEntity.weather![0].description!.toUpperCase(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade300,
                              letterSpacing: 3),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        WeatherIcon.setIcon(
                            currentWeatherEntity.weather![0].icon!,
                            60,
                            Colors.white),
                        SizedBox(
                          width: width,
                          height: 130,
                          child: PageView(
                            controller: pageController,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "${currentWeatherEntity.main!.temp}\u00B0",
                                      style: const TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Max",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color:
                                                        Colors.grey.shade300),
                                              ),
                                              Text(
                                                "${currentWeatherEntity.main!.tempMax}\u00B0",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.grey.shade300,
                                            thickness: 2,
                                            indent: 7,
                                            endIndent: 5,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Min",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color:
                                                        Colors.grey.shade300),
                                              ),
                                              Text(
                                                "${currentWeatherEntity.main!.tempMin}\u00B0",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(color: Colors.amber)
                            ],
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          onDotClicked: (index) {
                            pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          effect: const ExpandingDotsEffect(
                              dotHeight: 7,
                              dotWidth: 10,
                              dotColor: Colors.yellow,
                              activeDotColor: Colors.red),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // SizedBox(
                        //   height: 100,
                        //   width: double.infinity,
                        //   child: ListView.builder(
                        //     itemCount: 20,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context, index) {
                        //       return Container(
                        //         width: 70,
                        //         child: Card(
                        //           color: Colors.transparent,
                        //           elevation: 0,
                        //           child: Column(
                        //             children: [
                        //               // Text(
                        //               //   forcasts![index + 1]
                        //               //       .date
                        //               //       .toString(),
                        //               //   style: TextStyle(
                        //               //       fontSize: 10,
                        //               //       color: Colors.grey),
                        //               // ),
                        //               Spacer(),
                        //               // Text(
                        //               //   forcasts[index + 1]
                        //               //       .time
                        //               //       .toString(),
                        //               //   style: TextStyle(
                        //               //       fontSize: 10,
                        //               //       color: Colors.grey),
                        //               // ),
                        //               Spacer(),
                        //               // setIcon(
                        //               //     forcasts[index + 1]
                        //               //         .icon
                        //               //         .toString(),
                        //               //     20),
                        //               Spacer(),
                        //               // Text(
                        //               //     forcasts[index + 1]
                        //               //             .temp
                        //               //             .toString() +
                        //               //         "\u2103",
                        //               //     style: TextStyle(
                        //               //         color: Colors.white,
                        //               //         fontSize: 12)),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        const SizedBox(
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  CupertinoIcons.wind,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                      "${currentWeatherEntity.wind!.speed}m/s",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                width: 2,
                                height: 45,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                const Icon(
                                  CupertinoIcons.sunrise,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      TimeFormatter.getSunriseTime(
                                          currentWeatherEntity),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                width: 2,
                                height: 45,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                const Icon(
                                  CupertinoIcons.sunset,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      TimeFormatter.getSunsetTime(
                                          currentWeatherEntity),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                width: 2,
                                height: 45,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                const Icon(
                                  CupertinoIcons.drop,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      "${currentWeatherEntity.main!.humidity}%",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ));
              } else {
                return Center(child: Lottie.asset('assets/lottie/error.json'));
              }
            },
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
