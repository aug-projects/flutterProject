import 'package:flutter/material.dart';

/*
|--------------------------------------------------------------------------
| colors
|--------------------------------------------------------------------------
*/

const primaryColor = Color(0xff009788);
const dangerColor = Color(0xffe74a3b);
const successColor = Color(0xff1cc88a);
const warningColor = Color(0xfff6c23e);
const backgroundColor = Color(0xffffffff);
const secondaryColor = Color(0xff898989);
const borderColor = Color(0xffe2e2e2);

const ColorScheme colorScheme = ColorScheme(
  primary: primaryColor,
  secondary: secondaryColor,
  background: backgroundColor,
  surface: backgroundColor,
  onBackground: backgroundColor,
  error: dangerColor,
  onError: dangerColor,
  onPrimary: Colors.white,
  onSecondary: backgroundColor,
  onSurface: Colors.black12,
  brightness: Brightness.light,
);

/*
|--------------------------------------------------------------------------
| icons
|--------------------------------------------------------------------------
*/

const textIconSize = 15.0;

/*
|--------------------------------------------------------------------------
| fonts
|--------------------------------------------------------------------------
*/

const headlineTextStyle = TextStyle(
  fontSize: 25,
);
const titleTextStyle = TextStyle(
  fontSize: 18,
);
const leadingTextStyle = TextStyle(
  fontSize: 20,
);
const buttonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);
const appBarTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

/*
|--------------------------------------------------------------------------
| forms
|--------------------------------------------------------------------------
*/

const borderRadius = BorderRadius.all(Radius.circular(15.0));