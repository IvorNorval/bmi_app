import 'package:bmi_app/components/bmi_calculator.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/icon_content.dart';
import 'package:bmi_app/components/measurement.dart';
import 'package:bmi_app/components/measurement_row.dart';
import 'package:bmi_app/components/results_page.dart';
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
  Gender selectedGender = Gender.female;
  int ageImage = kAdultAge;
  String genderString = kFemale;

  Measurement heightMeasurement = Measurement(
      name: 'Height', unit: 'cm', initialValue: 170, max: 230, min: 60);
  Measurement weightMeasurement = Measurement(
      name: 'Weight', unit: 'kg', initialValue: 70, max: 150, min: 5);
  Measurement ageMeasurement =
      Measurement(name: 'Age', unit: ' ', initialValue: 30, max: 110, min: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 220,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: heightMeasurement.value.toDouble(),
                    width: weightMeasurement.value.toDouble(),
                    child: Center(
                      child: Image.asset(
                        'images/$genderString$ageImage.jpg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
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
            MeasurementRow(
              measurement: heightMeasurement,
              onChange: (double newValue) {
                setState(() {
                  heightMeasurement.value = newValue.round();
                });
              },
            ),
            MeasurementRow(
              measurement: weightMeasurement,
              onChange: (double newValue) {
                setState(() {
                  weightMeasurement.value = newValue.round();
                });
              },
            ),
            MeasurementRow(
              measurement: ageMeasurement,
              onChange: (double newValue) {
                setState(() {
                  ageMeasurement.value = newValue.round();
                  if (ageMeasurement.value < kToddlerAge)
                    ageImage = kBabyAge;
                  else if (ageMeasurement.value < kChildAge)
                    ageImage = kToddlerAge;
                  else if (ageMeasurement.value < kTeenagerAge)
                    ageImage = kChildAge;
                  else if (ageMeasurement.value < kAdultAge)
                    ageImage = kTeenagerAge;
                  else if (ageMeasurement.value < k50PlusAge)
                    ageImage = kAdultAge;
                  else if (ageMeasurement.value < kOldAge)
                    ageImage = k50PlusAge;
                  else
                    ageImage = kOldAge;
                });
              },
            ),
            BottomButton(
              onTap: () {
                BmiCalculator calc = BmiCalculator(
                    height: heightMeasurement.value,
                    wright: weightMeasurement.value);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResults: calc.calcBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              buttonTitle: 'CALCULATE BMI...',
            ),
          ],
        ),
      ),
    );
  }
}
