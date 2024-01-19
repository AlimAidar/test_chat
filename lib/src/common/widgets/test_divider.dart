import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';

class TestDivider extends Divider {
  const TestDivider({
    Key? key,
    Color color = AppColors.dividerColor,
    double thickness = 1,
  }) : super(
          key: key,
          color: color,
          thickness: thickness,
          height: 1,
        );
}
