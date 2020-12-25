import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
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
    fetchCountryWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Country Stats')),
        body: countryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ]),
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(countryData[index]['country'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  SizedBox(height:15),
                                  Image.network(
                                      countryData[index]['countryInfo']['flag'],
                                      height: 40,
                                      width: 80)
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(
                                    'CONFIRMED ' +
                                        countryData[index]['cases'].toString() +
                                        " (+" +
                                        countryData[index]['todayCases']
                                            .toString() +
                                        ")",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text(
                                    'ACTIVE ' +
                                        countryData[index]['active'].toString(),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text(
                                    'RECOVERED ' +
                                        countryData[index]['recovered']
                                            .toString() +
                                        " (+" +
                                        countryData[index]['todayRecovered']
                                            .toString() +
                                        ")",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text(
                                    'DEATHS ' +
                                        countryData[index]['cases'].toString() +
                                        " (+" +
                                        countryData[index]['todayDeaths']
                                            .toString() +
                                        ")",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ));
  }
}
