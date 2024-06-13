import 'package:flutter/material.dart';

double getScreenSizeByPercent(
        {required BuildContext context, required double percent}) =>
    MediaQuery.of(context).size.height * (percent / 100);
