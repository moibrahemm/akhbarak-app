import 'package:flutter/material.dart';

extension SizeMediaQuery on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
