import 'package:covid19_tracker/constants/api_constants.dart';
import 'package:covid19_tracker/localization/app_localization.dart';
import 'package:flutter/material.dart';

class Country{

  String countryName;
  String displayName;
  String continent;
  String flagLink;
  int id;
  String iso2;
  String iso3;
  int totalCases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int mild;
  double casesPerOneMil;
  double deathsPerOneMil;
  int tests;
  double testPerOneMil;
  DateTime updated;
  List<double> cnfCasesSeries;
  List<double> recCasesSeries;
  List<double> detCasesSeries;

  void generateList(Map map){
    cnfCasesSeries = List();
    recCasesSeries = List();
    detCasesSeries = List();

    map.forEach((key, value) {
      cnfCasesSeries.add(
        double.parse(value[kConfirmed].toString()),
      );
      recCasesSeries.add(
        double.parse(value[kRecovered].toString()),
      );
      detCasesSeries.add(
        double.parse(value[kDeaths].toString()),
      );
    });

  }

  Country.fromMap(BuildContext context, Map<String,dynamic> map){
    this.countryName = map[kCountry];
    this.continent = map[kCountryContinent];
    this.flagLink = map[kCountryInfo][kFlagLink];
    this.id = map[kCountryInfo][kCountryID];
    this.iso2 = map[kCountryInfo][kISO2];
    this.iso3 = map[kCountryInfo][kISO3];
    this.totalCases = map[kCountryTotalCases];
    this.todayCases = map[kCountryTodayCases];
    this.deaths = map[kCountryDeaths];
    this.todayDeaths = map[kCountryTodayDeaths];
    this.recovered = map[kCountryRecovered];
    this.active = map[kCountryActive];
    this.critical = map[kCountryCritical];
    this.casesPerOneMil = double.parse(map[kCountryCasesPerOneMil].toString());
    this.deathsPerOneMil = double.parse(map[kCountryDeathsPerOneMil].toString());
    this.tests = map[kCountryTests];
    this.testPerOneMil = double.parse(map[kCountryTestsPerOneMil].toString());
    this.mild = active-critical;
    this.displayName = AppLocalizations.of(context).translate(this.countryName.toLowerCase().replaceAll(" ","_"));
    this.updated = DateTime.fromMillisecondsSinceEpoch(map[kCountryUpdated]);
  }

}