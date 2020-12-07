import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circular_slider/appearance.dart';
import 'circular_slider/circular_slider.dart';
import 'common_widgets/form_field_setup.dart';
import 'common_widgets/spacings.dart';
import 'constants/colors.dart';

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
  List<bool> _isSelected;
  TextEditingController _value = TextEditingController();
  double _sliderValue = 10;

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isSelected = [true, false];
    _value.text = _sliderValue.toStringAsFixed(0);
  }

  String _formatIntervalTime(int init, double end) {
    return end.toStringAsFixed(0);
  }

  void _updateLabelsD(int init, double value) {
    setState(() {
      _value.text = _formatIntervalTime(init, value);
      _sliderValue = value;
    });
  }
 String updateText(double value){
    if(value > 0 && value <=80){
      return 'Your glucose level is too low. Avoid insuline. ';
    }else if(value > 80 && value <=100){
      return 'Your glucose level is normal. Good job and keep it up. ';
    }else if(value > 100 && value <=130){
      return 'Your glucose level is high. Take precautions for it.';
    }else{
      return 'Your glucose level is too high. Take insulin and avoid eating sugar food. ';
    }
 }
  Color _getColor() {
    Color cc = Colors.red;

    if (_isSelected[0]) {
      if (double.parse(_formatIntervalTime(0, _sliderValue)) <= 80) {
        return AppColors.cea5946;
      } else if (double.parse(_formatIntervalTime(0, _sliderValue)) > 80 &&
          double.parse(_formatIntervalTime(0, _sliderValue)) <= 100) {
        return AppColors.cffdf44;
      } else if (double.parse(_formatIntervalTime(0, _sliderValue)) > 100 &&
          double.parse(_formatIntervalTime(0, _sliderValue)) <= 130) {
        return Colors.green;
      } else {
        return AppColors.cea5946;
      }
    } else {
      if (double.parse(_formatIntervalTime(0, _sliderValue)) <= 140) {
        return AppColors.cffdf44;
      } else if (double.parse(_formatIntervalTime(0, _sliderValue)) > 140 &&
          double.parse(_formatIntervalTime(0, _sliderValue)) <= 180) {
        return Colors.green;
      } else {
        return AppColors.cea5946;
      }
    }
    return cc;
  }

  Widget _slider() {
    return SleekCircularSlider(
      initialValue: double.parse(_value.text),
      child: Padding(
        padding: const EdgeInsets.all(42.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SPH(10),
            FormFielsSetup(
              controller: _value,
              onFieldSubmitted: (val) {
                _updateLabelsD(0, double.parse(val));
              },
              // onChanged: (val) {
              //   _updateLabelsD(0, int.parse(val), 0);
              // },
            ),
            SPH(10),
            Text("mg/dL",
                style: TextStyle(
                  // fontFamily: Keys.fontFamilyNoto,
                  color: Color(0xffffffff),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )),
          ],
        )),
      ),

      appearance: CircularSliderAppearance(
        size: 200,
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
          progressBarColor: _getColor(),
          trackColor: Colors.grey,
        ),
      ),
      //initialValue: 20,
      max: 300,

      onChange: (double value) {
        print(value);
        _sliderValue = value;
        _updateLabelsD(0, value);
      },
    );
  }

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'ADD BLOOD GLUCOSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 110,
                backgroundColor: Colors.black,
                child: _slider(),
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
                isSelected: _isSelected,
                onPressed: (index) {
                  setState(() {
                    for (var i = 0; i < _isSelected.length; i++) {
                      if (i == index) {
                        _isSelected[i] = true;
                      } else {
                        _isSelected[i] = false;
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
              Spacer(),
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
