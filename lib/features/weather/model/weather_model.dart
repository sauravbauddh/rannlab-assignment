class WeatherModel {
  String? cityName;
  String? postalCode;
  String? country;
  List<Data>? data;

  WeatherModel({
    this.cityName,
    this.postalCode,
    this.country,
    this.data,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    postalCode = json['postal_code'];
    country = json['country'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_name'] = cityName;
    data['postal_code'] = postalCode;
    data['country'] = country;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  double? appMaxTemp;
  double? appMinTemp;
  int? clouds;
  int? cloudsHi;
  int? cloudsLow;
  int? cloudsMid;
  String? datetime;
  double? dewpt;
  double? highTemp;
  double? lowTemp;
  double? maxTemp;
  double? minTemp;
  double? moonPhase;
  double? moonPhaseLunation;
  int? moonriseTs;
  int? moonsetTs;
  double? ozone;
  int? pop;
  double? precip;
  double? pres;
  int? rh;
  double? slp;
  int? snow;
  int? snowDepth;
  int? sunriseTs;
  int? sunsetTs;
  double? temp;
  int? ts;
  double? uv;
  String? validDate;
  double? vis;
  Weather? weather;
  String? windCdir;
  String? windCdirFull;
  int? windDir;
  double? windGustSpd;
  double? windSpd;
  String? cityName;
  String? countryCode;

  Data({
    this.appMaxTemp,
    this.appMinTemp,
    this.clouds,
    this.cloudsHi,
    this.cloudsLow,
    this.cloudsMid,
    this.datetime,
    this.dewpt,
    this.highTemp,
    this.lowTemp,
    this.maxTemp,
    this.minTemp,
    this.moonPhase,
    this.moonPhaseLunation,
    this.moonriseTs,
    this.moonsetTs,
    this.ozone,
    this.pop,
    this.precip,
    this.pres,
    this.rh,
    this.slp,
    this.snow,
    this.snowDepth,
    this.sunriseTs,
    this.sunsetTs,
    this.temp,
    this.ts,
    this.uv,
    this.validDate,
    this.vis,
    this.weather,
    this.windCdir,
    this.windCdirFull,
    this.windDir,
    this.windGustSpd,
    this.windSpd,
    this.cityName,
    this.countryCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['app_max_temp'] = appMaxTemp;
    data['app_min_temp'] = appMinTemp;
    data['clouds'] = clouds;
    data['clouds_hi'] = cloudsHi;
    data['clouds_low'] = cloudsLow;
    data['clouds_mid'] = cloudsMid;
    data['datetime'] = datetime;
    data['dewpt'] = dewpt;
    data['high_temp'] = highTemp;
    data['low_temp'] = lowTemp;
    data['max_temp'] = maxTemp;
    data['min_temp'] = minTemp;
    data['moon_phase'] = moonPhase;
    data['moon_phase_lunation'] = moonPhaseLunation;
    data['moonrise_ts'] = moonriseTs;
    data['moonset_ts'] = moonsetTs;
    data['ozone'] = ozone;
    data['pop'] = pop;
    data['precip'] = precip;
    data['pres'] = pres;
    data['rh'] = rh;
    data['slp'] = slp;
    data['snow'] = snow;
    data['snow_depth'] = snowDepth;
    data['sunrise_ts'] = sunriseTs;
    data['sunset_ts'] = sunsetTs;
    data['temp'] = temp;
    data['ts'] = ts;
    data['uv'] = uv;
    data['valid_date'] = validDate;
    data['vis'] = vis;
    if (weather != null) {
      data['weather'] = weather!.toJson();
    }
    data['wind_cdir'] = windCdir;
    data['wind_cdir_full'] = windCdirFull;
    data['wind_dir'] = windDir;
    data['wind_gust_spd'] = windGustSpd;
    data['wind_spd'] = windSpd;
    data['city_name'] = cityName;
    data['country_code'] = countryCode;
    return data;
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      appMaxTemp: json['app_max_temp']?.toDouble(),
      appMinTemp: json['app_min_temp']?.toDouble(),
      clouds: json['clouds'],
      cloudsHi: json['clouds_hi'],
      cloudsLow: json['clouds_low'],
      cloudsMid: json['clouds_mid'],
      datetime: json['datetime'],
      dewpt: json['dewpt']?.toDouble(),
      highTemp: json['high_temp']?.toDouble(),
      lowTemp: json['low_temp']?.toDouble(),
      maxTemp: json['max_temp']?.toDouble(),
      minTemp: json['min_temp']?.toDouble(),
      moonPhase: json['moon_phase']?.toDouble(),
      moonPhaseLunation: json['moon_phase_lunation']?.toDouble(),
      moonriseTs: json['moonrise_ts'],
      moonsetTs: json['moonset_ts'],
      ozone: json['ozone']?.toDouble(),
      pop: json['pop'],
      precip: json['precip']?.toDouble(),
      pres: json['pres']?.toDouble(),
      rh: json['rh'],
      slp: json['slp']?.toDouble(),
      snow: json['snow'],
      snowDepth: json['snow_depth'],
      sunriseTs: json['sunrise_ts'],
      sunsetTs: json['sunset_ts'],
      temp: json['temp']?.toDouble(),
      ts: json['ts'],
      uv: json['uv']?.toDouble(),
      validDate: json['valid_date'],
      vis: json['vis']?.toDouble(),
      weather:
          json['weather'] != null ? Weather.fromJson(json['weather']) : null,
      windCdir: json['wind_cdir'],
      windCdirFull: json['wind_cdir_full'],
      windDir: json['wind_dir'],
      windGustSpd: json['wind_gust_spd']?.toDouble(),
      windSpd: json['wind_spd']?.toDouble(),
      cityName: json['city_name'],
      countryCode: json['country_code'],
    );
  }
}

class Weather {
  String? description;
  int? code;
  String? icon;

  Weather({this.description, this.code, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    code = json['code'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['code'] = code;
    data['icon'] = icon;
    return data;
  }
}
