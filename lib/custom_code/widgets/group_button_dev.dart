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

class GroupButtonDev extends StatefulWidget {
  GroupButtonDev({
    Key? key,
    this.width,
    this.height,
    this.jsonButtons,
  }) : super(key: key);

  final double? width;
  final double? height;
  dynamic jsonButtons;
  final controller = GroupButtonController();

  @override
  _GroupButtonDevState createState() => _GroupButtonDevState();
}

class _GroupButtonDevState extends State<GroupButtonDev> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GroupButton(
          controller: widget.controller,
          isRadio: false,
          //buttons: List.generate(25, (i) => '${i + 1}'),
          buttons: "ADMIN CLIENTE TECNICO".split(" "),
          //maxSelected: 10,
          onSelected: (val, i, selected) => {
                widget.jsonButtons =
                    jsonEncode(widget.controller.selectedIndexes.toList()),
              }),
    );
  }
}
