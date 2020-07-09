import 'package:bmi_app/components/measurement.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MeasurementRow extends StatelessWidget {
  MeasurementRow({this.measurement, this.onChange});

  final Measurement measurement;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  measurement.name.toUpperCase(),
                  style: kLabelTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Text(
                  measurement.value.toString(),
                  style: kBodyTextStyle,
                ),
              ),
              Text(
                measurement.unit,
                style: kBodyTextStyle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kActiveColor,
              inactiveTrackColor: kInactiveColor,
              thumbColor: kAccentColor,
              overlayColor: kAccentTransparentColor,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: measurement.value.toDouble(),
              min: measurement.min.toDouble(),
              max: measurement.max.toDouble(),
              onChanged: onChange,
            ),
          ),
        ),
      ],
    );
  }
}
