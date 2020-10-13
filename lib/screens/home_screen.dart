import 'dart:ffi';

import 'package:covidtracker/config/styles.dart';
import 'package:covidtracker/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/models/info_model.dart';
import 'package:covidtracker/screens/info_screen.dart';
import 'dart:convert';
import 'package:covidtracker/config/palette.dart';
import 'package:covidtracker/widgets/widgets.dart';
import 'package:covidtracker/data/indiapanel.dart';
import 'package:http/http.dart' as http;



import 'package:dynamic_theme/dynamic_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country= 'IN';

  Map indiaData;

  fetchData()async {
    http.Response response= await http.get('https://corona-virus-world-and-india-data.p.rapidapi.com/api_india', headers: {
      "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
      "x-rapidapi-key": "6dfb8ffb16msh74ee88341577c12p11e124jsn926ded5fe9c3"
    });
    setState(() {

      indiaData=json.decode(response.body);
    });


  }

  @override
    void initState(){
    fetchData();

      super.initState();
    }





  Widget build(BuildContext context) {
    //getData();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFd4f3ef),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(screenHeight),
            _buildIndiaPanel(screenHeight),
          ],
        )
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(



      child: Container(




        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,


          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top:30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'COVID-19',
                    style: const TextStyle(
                      color: Colors.white70  ,
                      fontSize:30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CountryDropdown(
                    countries: ['IN'],
                    country: _country,
                    onChanged: (val) => setState(() => _country = val),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Stay at home, maintain social distancing.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'The safety of the people shall be the highest law.',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    '~ Marcus Tullius Cicero',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              )

            ],
          ),
        ),


      ),
    );
  }
  SliverToBoxAdapter _buildIndiaPanel(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(


        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[


            Text(
              'Current Outbrake',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'India.',
              style: const TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),




            indiaData==null?CircularProgressIndicator():IndiaPanel(indiaData: indiaData,),
                SizedBox(height: 20.0,),
                Text(
                  'Stay Updated.',
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0,),
                FlatButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 80.0,
                  ),

                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) => InfoScreen(info: infos[0]),
                      ),
                    );
                  },
                  color: Color(0xFF132743),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: const Icon(
                    Icons.do_not_disturb_alt,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Symptoms',
                    style: Styles.buttonTextStyle,
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20.0,),
                FlatButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 80.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InfoScreen(info: infos[1]),
                      ),
                    );
                  },
                  color: Color(0xFF31112c),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Prevention',
                    style: Styles.buttonTextStyle,
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            FlatButton.icon(

              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 80.0,
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InfoScreen(info: infos[2]),
                  ),
                );
              },
              color: Color(0xFF221f3b),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              label: Text(
                'How it spreads ?',
                style: Styles.buttonTextStyle,
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 20.0,),





          ],
        ),

      ),
    );
  }
}
