import 'dart:async';
import 'package:floor/floor.dart';
import 'package:live_weather/features/bookmark/data/data_source/local/city_dao.dart';
import 'package:live_weather/features/bookmark/domain/entity/city_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [City])
abstract class AppDatabase extends FloorDatabase {
  CityDao get cityDao;
}