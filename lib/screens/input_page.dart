import 'package:bmi_app/components/icon_content.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 192;
  int weight = 70;
  int age = 30;
  int ageImage = kAdultAge;
  String genderString = kFemale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                height: height.toDouble(),
                width: weight.toDouble(),
                child: Center(
                  child: Image.asset(
                    'images/$genderString$ageImage.jpg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                      genderString = kMale;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MARS',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                      genderString = kFemale;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'VENUS',
                  ),
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kActiveColor,
              inactiveTrackColor: kInactiveColor,
              thumbColor: kAccentColor,
              overlayColor: kAccentTransparentColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 30,
              max: 220,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
                  print(height);
                });
              },
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kActiveColor,
              inactiveTrackColor: kInactiveColor,
              thumbColor: kAccentColor,
              overlayColor: kAccentTransparentColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: weight.toDouble(),
              min: 20.0,
              max: 150.0,
              onChanged: (double newValue) {
                setState(() {
                  weight = newValue.round();
                  print(weight);
                });
              },
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kActiveColor,
              inactiveTrackColor: kInactiveColor,
              thumbColor: kAccentColor,
              overlayColor: kAccentTransparentColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: age.toDouble(),
              min: 0,
              max: 100,
              onChanged: (double newValue) {
                setState(() {
                  age = newValue.round();
                  if (age < kToddlerAge)
                    ageImage = kBabyAge;
                  else if (age < kChildAge)
                    ageImage = kToddlerAge;
                  else if (age < kTeenagerAge)
                    ageImage = kChildAge;
                  else if (age < kAdultAge)
                    ageImage = kTeenagerAge;
                  else if (age < k50PlusAge)
                    ageImage = kAdultAge;
                  else if (age < kOldAge)
                    ageImage = k50PlusAge;
                  else
                    ageImage = kOldAge;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
