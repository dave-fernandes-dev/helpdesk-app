// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'dart:convert';
import 'package:group_button/group_button.dart';

class GroupButton extends StatefulWidget {
  GroupButton({
    Key? key,
    this.width,
    this.height,
    //this.jsonButtons,
    //this.controller,
  }) : super(key: key);

  final double? width;
  final double? height;
  //final dynamic? jsonButtons;
  //final controller = GroupButtonController();

  @override
  _GroupButtonState createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
