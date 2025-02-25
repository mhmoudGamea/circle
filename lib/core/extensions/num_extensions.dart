import 'package:flutter/material.dart';

import '../services/responsive_service.dart';

extension SizeExtension on num {
  double get w => ResponsiveService.scaleWidth() * this;

  double get h => ResponsiveService.scaleHeight() * this;

  double get r => ResponsiveService.scaleRadius() * this;

  double get sp => ResponsiveService.scaleText() * this;
}

extension RowExtensions on Row {
  // ontap methos extension
  Widget onTap(VoidCallback tap) => InkWell(onTap: tap, child: this);
}
