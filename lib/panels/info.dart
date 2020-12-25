import 'package:covid_app/pages/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FAQpage();
              }));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryBlack,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('FAQs',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 35)
                  ],
                ),
              ),
            ),
          ),
          sb(),
          GestureDetector(
              onTap: () {
                launch('https://covid19responsefund.org/');
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryBlack,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DONATE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 35)
                    ],
                  ),
                ),
              )),
          sb(),
          GestureDetector(
            onTap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryBlack,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('WHO Guidlines'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 35)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
