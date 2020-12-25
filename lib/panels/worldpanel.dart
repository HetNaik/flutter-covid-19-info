import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          StatusPanel(
            pColor: Colors.red[200],
            tColor: Colors.red[900],
            title: 'CONFIRMED',
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            pColor: Colors.blue[200],
            tColor: Colors.blue[900],
            title: 'ACTIVE',
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            pColor: Colors.green[200],
            tColor: Colors.green[900],
            title: 'RECOVERED',
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            pColor: Colors.grey[400],
            tColor: Colors.grey[900],
            title: 'DEATHS',
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color pColor, tColor;
  final String title, count;

  const StatusPanel({Key key, this.pColor, this.tColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: pColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, color: tColor)),
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, color: tColor),
          )
        ],
      ),
    );
  }
}
