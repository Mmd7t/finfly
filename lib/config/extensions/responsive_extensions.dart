import 'package:flutter/material.dart';

//NOTE ==> Custom MediaQuery Extension
extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
