import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_chat/src/common/constants/color_constants.dart';

class TextStyles {
  static const TextStyle heading = TextStyle(
    color: AppColors.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontFamily: 'FuturaPT-Demi',
  );
  static const TextStyle chatName = TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'FuturaPT-Demi',
  );
  static const TextStyle chatMessage = TextStyle(
    color: AppColors.darkGrey,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'FuturaPT-Demi',
  );
  static TextStyle chatImageText = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'FuturaPT-Demi',
  );

  static TextStyle lableTextStyle = const TextStyle(
    color: AppColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'FuturaPT-Demi',
  );
}
