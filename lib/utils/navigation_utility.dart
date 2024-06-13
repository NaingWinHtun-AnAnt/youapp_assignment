import 'package:flutter/material.dart';

extension NavigationExtension on Widget {
  void navigateTo(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

  void navigateReplacementTo(BuildContext context, Widget page) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));

  void navigateAndRemoveUntil(BuildContext context, Widget page) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => page), (route) => false);

  void popBack(BuildContext context) => Navigator.of(context).pop();
}
