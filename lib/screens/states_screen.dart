import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covidtracker/data/indiapanel.dart';

//import 'package:tgd_covid_tracker/pages/search.dart';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  Map stateData;


  fetchData()async {

//    http.Response response= await http.get('https://corona-virus-world-and-india-data.p.rapidapi.com/api_india', headers: {
//      "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
//      "x-rapidapi-key": "6dfb8ffb16msh74ee88341577c12p11e124jsn926ded5fe9c3"
//    });
    http.Response response= await http.get('https://api.rootnet.in/covid19-in/stats/latest');

    if(response.statusCode==200){
      String data= response.body;
      var decodedData=jsonDecode(data);


      //print(data);

    } else {
      print(response.statusCode);
    }
    setState(() {

      stateData=json.decode(response.body);
      print(stateData);
    });


  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        elevation: 10.0,
        shadowColor: Color(0xFF7579e7),


        title:  Center(
          child: Text(
            'Covid-19 Cases - State Wise',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFd4f3ef),
      

      body: stateData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : 
      Container(



        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(

              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF2b2b28),
                  width: 5,
                ),
                //borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0XFF7579e7),
                    offset: new Offset(10.0, 10.0),
                  ),
                ],
              ),


              //height: 270.0,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(


                children: <Widget>[


              GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 2),
                    children: <Widget>[
                      StatusPanel(
                        title: 'CONFIRMED',
                        panelColor: Color(0xFFeb4559),
                        textColor: Colors.white,
                        count: stateData['data']['regional'][index]['totalConfirmed'].toString(),
                      ),
                      StatusPanel(
                        title: 'FOREIGNER',
                        panelColor: Color(0xFF56556e),
                        textColor: Colors.white,
                        count: stateData['data']['regional'][index]['confirmedCasesForeign'].toString(),
                      ),
                      StatusPanel(
                        title: 'RECOVERED',
                        panelColor: Color(0xFF21bf73),
                        textColor: Colors.white,
                        count: stateData['data']['regional'][index]['discharged'].toString(),
                      ), StatusPanel(
                        title: 'DEATHS',
                        panelColor: Color(0xFF393b44),
                        textColor: Colors.white,
                        count: stateData['data']['regional'][index]['deaths'].toString(),
                      ),



                    ],

                  ),
                  SizedBox(height: 10.0,),



                  Container(
                    width: 300.0,
                    //margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          stateData['data']['regional'][index]['loc'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white70),
                        ),
//

                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),

            );
          },


          itemCount: 36,


        ),
      ),


    );
  }
}

