import 'package:live_weather/features/weather/domain/entity/current_weather_entity.dart';

class CurrentWeather extends CurrentWeatherEntity {
  // Coord? coord;
  // List<Weather>? weather;
  // String? base;
  // Main? main;
  // int? visibility;
  // Wind? wind;
  // Rain? rain;
  // Clouds? clouds;
  // int? dt;
  // Sys? sys;
  // int? timezone;
  // int? id;
  // String? name;
  // int? cod;

  const CurrentWeather({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.rain,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
      weather: json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList(),
      base: json["base"],
      main: json["main"] == null ? null : Main.fromJson(json["main"]),
      visibility: json["visibility"],
      wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
      rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
      dt: json["dt"],
      sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
      cod: json["cod"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data["coord"] = coord?.toJson();
    }
    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    data["base"] = base;
    if (main != null) {
      data["main"] = main?.toJson();
    }
    data["visibility"] = visibility;
    if (wind != null) {
      data["wind"] = wind?.toJson();
    }
    if (rain != null) {
      data["rain"] = rain?.toJson();
    }
    if (clouds != null) {
      data["clouds"] = clouds?.toJson();
    }
    data["dt"] = dt;
    if (sys != null) {
      data["sys"] = sys?.toJson();
    }
    data["timezone"] = timezone;
    data["id"] = id;
    data["name"] = name;
    data["cod"] = cod;
    return data;
  }
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if (json["sunset"] is int) {
      sunset = json["sunset"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["id"] = id;
    data["country"] = country;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    if (json["all"] is int) {
      all = json["all"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = all;
    return data;
  }
}

class Rain {
  double? oneHour;

  Rain({this.oneHour});

  Rain.fromJson(Map<String, dynamic> json) {
    if (json["1h"] is double) {
      oneHour = json["1h"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["1h"] = oneHour;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    if (json["speed"] is double) {
      speed = json["speed"];
    }
    if (json["deg"] is int) {
      deg = json["deg"];
    }
    if (json["gust"] is double) {
      gust = json["gust"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["speed"] = speed;
    data["deg"] = deg;
    data["gust"] = gust;
    return data;
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    if (json["temp"] is double) {
      temp = json["temp"];
    }
    if (json["feels_like"] is double) {
      feelsLike = json["feels_like"];
    }
    if (json["temp_min"] is double) {
      tempMin = json["temp_min"];
    }
    if (json["temp_max"] is double) {
      tempMax = json["temp_max"];
    }
    if (json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if (json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if (json["sea_level"] is int) {
      seaLevel = json["sea_level"];
    }
    if (json["grnd_level"] is int) {
      grndLevel = json["grnd_level"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    data["sea_level"] = seaLevel;
    data["grnd_level"] = grndLevel;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["main"] is String) {
      main = json["main"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    if (json["lon"] is double) {
      lon = json["lon"];
    }
    if (json["lat"] is double) {
      lat = json["lat"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lon"] = lon;
    data["lat"] = lat;
    return data;
  }
}
