import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFeildStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(color: Colors.black),
    hoverColor: Colors.black,
    iconColor: Colors.white,
    counterStyle: TextStyle(color: Colors.black),
    icon: Icon(Icons.location_city_outlined),
    hintStyle: TextStyle(
        fontWeight: FontWeight.w400, fontSize: 23, color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0))),
    hintText: 'INPUT CITY',
    alignLabelWithHint: true);
