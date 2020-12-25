import 'package:flutter/material.dart';

import '../data.dart';

class FAQpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('FAQs'),
        ),
        body: ListView.builder(
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(DataSource.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(DataSource.questionAnswers[index]['answer']),
                )
              ],
            );
          },
        ));
  }
}
