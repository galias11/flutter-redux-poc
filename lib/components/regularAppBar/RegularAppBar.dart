// @Vendors
import 'package:flutter/material.dart';

AppBar regularAppBar({String title}) {
  return new AppBar(
    title: Align(
      alignment: Alignment.centerLeft,
      child: Text(title)
    ),
    automaticallyImplyLeading: true
  );
}