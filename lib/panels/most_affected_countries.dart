import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
        child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10),
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 35,
                ),
                SizedBox(width: 30),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30),
                Text(countryData[index]['cases'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
          ),
        );
      },
      itemCount: 5,
    ));
  }
}
