//NOTE ==> Custom Image Extension
import 'package:flutter/material.dart';

extension CustomImage on String {
  Widget assetImage({double? width, BoxFit? fit}) => Image.asset(
        'assets/imgs/$this',
        width: width ?? 50,
        fit: fit ?? BoxFit.none,
      );
}
