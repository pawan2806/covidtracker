import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  final Map indiaData;
  const IndiaPanel({Key key, this.indiaData}): super(key:key);





  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 3),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Color(0xFFd32626),
            textColor: Colors.white70,
            count: indiaData['total_values']['confirmed'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Color(0xFF6886c5),
            textColor: Colors.white70,
            count: indiaData['total_values']['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Color(0xFF0c9463),
            textColor: Colors.white70,
            count: indiaData['total_values']['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Color(0xFF52575d),
            textColor: Colors.white70,
            count: indiaData['total_values']['deaths'].toString(),
          ),


        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width/2 ,
      color: panelColor,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
