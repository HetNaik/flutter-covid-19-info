import 'dart:convert';

import 'package:covid_app/pages/country.dart';
import 'package:covid_app/panels/info.dart';
import 'package:covid_app/panels/most_affected_countries.dart';
import 'package:covid_app/panels/worldpanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;

  fetchCountryWideData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    print(fetchCountryWideData());
    print(fetchWorldWideData());
    fetchWorldWideData();
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'COVID-19 TRACKER',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.orange[100],
            child: Text(DataSource.quote,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                    fontSize: 16)),
          ),
          sb(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Around the world',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                RaisedButton(
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) {
                      return CountryPage();
                    }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child:
                      Text('Regional', style: TextStyle(color: Colors.white)),
                  color: primaryBlack,
                )
              ],
            ),
          ),
          worldData != null
              ? WorldwidePanel(
                  worldData: worldData,
                )
              : CircularProgressIndicator(),
          sb(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('Most Affected Countries by Confirmed Cases',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          sb(),
          countryData == null
              ? Container()
              : MostAffectedPanel(
                  countryData: countryData,
                ),
          sb(),
          InfoPanel(),
          sb(),
          Center(
            child: Text('Go out only if required, wear a mask',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ],
      )),
    );
  }
}
