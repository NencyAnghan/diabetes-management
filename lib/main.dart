import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CircularSlider(),
    );
  }
}

class CircularSlider extends StatefulWidget {
  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  List<bool> isSelected;

  // int level = 50;
  // Color colorDetector() {
  //   if (level > 0 && level <= 30) {
  //     return Colors.red;
  //   } else if (level > 30 && level <= 120) {
  //     return Colors.blue;
  //   } else if (level > 120 && level <= 240) {
  //     return Colors.yellow;
  //   } else if (level > 240 && level <= 300) {
  //     return Colors.orange[700];
  //   } else {
  //     return Colors.deepOrange[500];
  //   }
  // }

  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
  }

  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      size: 150,
      startAngle: 270,
      angleRange: 360,
      infoProperties: InfoProperties(
        mainLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),
        //modifier: ,
      ),
      customWidths: CustomSliderWidths(
        handlerSize: 10,
        trackWidth: 10,
      ),
      customColors: CustomSliderColors(
        progressBarColor: Colors.red,
        trackColor: Colors.grey,
      ),
    ),
    //initialValue: 20,
    max: 360,
    onChange: (double value) {
      print(value);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF66C5B7),
                  Color(0xFF1F8CB0),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'ADD BLOOD GLUCOSE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.black,
                  child: slider,
                ),
                SizedBox(
                  height: 20,
                ),
                ToggleButtons(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Pre-meal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Post-meal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      for (var i = 0; i < isSelected.length; i++) {
                        if (i == index) {
                          isSelected[i] = true;
                        } else {
                          isSelected[i] = false;
                        }
                      }
                    });
                  },
                  constraints: BoxConstraints(minHeight: 20, minWidth: 40),
                  color: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 3,
                  borderColor: Colors.black,
                  selectedBorderColor: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your glucose level is too low. Avoid insuline.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 170,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(' Value Cancelled');
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Value Entered');
                      },
                      child: Container(
                        height: 50,
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Enter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                               // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
