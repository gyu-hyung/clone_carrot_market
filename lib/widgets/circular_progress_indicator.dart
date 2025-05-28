import 'package:flutter/material.dart';

Widget buildLoadingIndicator(color) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    ),
  );
}