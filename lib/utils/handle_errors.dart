import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youapp_assignment/network/responses/get_profile_response.dart';
import 'package:youapp_assignment/network/responses/login_response.dart';
import 'package:youapp_assignment/network/responses/register_response.dart';
import 'package:youapp_assignment/network/responses/update_profile_response.dart';

String handleError({
  required dynamic error,
}) {
  if (error is DioException) {
    try {
      return error.response?.data ?? "";
    } on Error catch (e) {
      return e.toString();
    }
  } else {
    if (error is LoginResponse ||
        error is RegisterResponse ||
        error is GetProfileResponse ||
        error is UpdateProfileResponse) {
      return error.message ?? "Something went Wrong!!";
    } else {
      return error;
    }
  }
}

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(handleError(error: message)),
    duration: const Duration(seconds: 2),
  ));
}
