// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
    Covid({
       required this.id,
       required this.message,
       required this.global,
      required  this.countries,
       required this.date,
    });

  String id;
   String message;
     Global global;
   List<Country> countries;
    DateTime date;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        id: json["ID"],
        message: json["Message"],
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
        date: DateTime.parse(json["Date"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Message": message,
        "Global": global.toJson(),
        "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "Date": date.toIso8601String(),
    };
}

class Country {
    Country({
      required    this.id,
      required  this.country,
       required this.countryCode,
       required this.slug,
      required  this.newConfirmed,
       required this.totalConfirmed,
       required this.newDeaths,
       required this.totalDeaths,
        required  this.newRecovered,
       required this.totalRecovered,
       required this.date,
       required this.premium,
    });

    String id;
    String country;
    String countryCode;
    String slug;
    int newConfirmed;
    int totalConfirmed;
    int newDeaths;
    int totalDeaths;
    int newRecovered;
    int totalRecovered;
    DateTime date;
    Premium premium;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["ID"],
        country: json["Country"],
        countryCode: json["CountryCode"],
        slug: json["Slug"],
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
        premium: Premium.fromJson(json["Premium"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Country": country,
        "CountryCode": countryCode,
        "Slug": slug,
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
        "Date": date.toIso8601String(),
        "Premium": premium.toJson(),
    };
}

class Premium {
    Premium();

    factory Premium.fromJson(Map<String, dynamic> json) => Premium(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Global {
    Global({
       required this.newConfirmed,
      required  this.totalConfirmed,
      required this.newDeaths,
       required this.totalDeaths,
      required  this.newRecovered,
      required  this.totalRecovered,
       required this.date,
    });

    int newConfirmed;
    int totalConfirmed;
    int newDeaths;
    int totalDeaths;
    int newRecovered;
    int totalRecovered;
    DateTime date;

    factory Global.fromJson(Map<String, dynamic> json) => Global(
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
    );

    Map<String, dynamic> toJson() => {
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
        "Date": date.toIso8601String(),
    };
}
