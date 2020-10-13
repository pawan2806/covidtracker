import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidtracker/models/info_model.dart';
import 'package:covidtracker/screens/info_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin {
  String name = 'Tap Here';
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _infoSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.bounceIn.transform(value) * 500.0,
            width: Curves.bounceIn.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => InfoScreen(info: infos[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF212121),
                borderRadius: BorderRadius.circular(40.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[

                  Center(
                    child: Hero(
                      tag: infos[index].imageUrl,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          'assets/images/info$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),




                  Center(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15.0),

                        Text(
                          infos[index].category.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          infos[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd4f3ef),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.only(bottom: 30, top: 50,),
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              title: Text('Enter Your Name.'),
                              content: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });

                                      },
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                Center(
                                  child: FlatButton(
                                    child: Text(
                                      'Enter',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                      ),
                                    ),
                                    color: Color.fromRGBO(39, 21, 148, 1),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      name,
                      style:TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    'Welcome , Your health matters! Follow these resources to stay updated with Coronavirus prevention methods, symptoms and know how it spreads.',
                    style: GoogleFonts.notoSans(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 18,
                      color: Color(0xFF2a3d66),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Scroll Horizontally.',
                    style: GoogleFonts.notoSans(
                      textStyle: Theme.of(context).textTheme.display1,
                      fontSize: 18,
                      color: Color(0xFF2a3d66),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: infos.length,
                itemBuilder: (BuildContext context, int index) {
                  return _infoSelector(index);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
              child: Text(
                '~ Illustrations from freepik.com',
                style: GoogleFonts.notoSans(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 15,
                  color: Color(0xFF212121),
                  //fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
