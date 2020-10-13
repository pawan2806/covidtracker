import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidtracker/models/info_model.dart';

class InfoScreen extends StatefulWidget {
  final Info info;

  InfoScreen({this.info});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd4f3ef),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 40.0,
                    ),
                    height: 430.0,
                    color: Color(0xFF212121),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              widget.info.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 20.0),
                        Center(
                          child: Hero(
                            tag: widget.info.imageUrl,
                            child: Image(
                              height: 280.0,
                              width: 280.0,
                              image: AssetImage(widget.info.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30.0,),
              Container(
                height: 300.0,
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                decoration: BoxDecoration(
                  color: Color(0xFFd4f3ef),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 40.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Related Information ',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.0),

                          Text(
                            '~ ' +widget.info.description,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '~ ' +widget.info.description1,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '~ ' +widget.info.description2,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '~ ' + widget.info.description3,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
