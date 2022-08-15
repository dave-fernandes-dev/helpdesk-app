// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:checkbox_grouped/checkbox_grouped.dart';

class CheckBoxGrouped extends StatefulWidget {
  const CheckBoxGrouped({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CheckBoxGroupedState createState() => _CheckBoxGroupedState();
}

class _CheckBoxGroupedState extends State<CheckBoxGrouped> {
  @override
  Widget build(BuildContext context) {
    return SimpleGroupedCheckbox<int>(
      controller: GroupController(
        isMultipleSelection: true,
        initSelectedItem: List.generate(4, (index) => index),
      ),
      itemsTitle: ["1", "2", "4", "5"],
      values: [1, 2, 4, 5],
      groupStyle: GroupStyle(
          activeColor: Colors.blue, itemTitleStyle: TextStyle(fontSize: 13)),
      checkFirstElement: false,
      onItemSelected: (data) {
        AlertDialog(title: Text(data));
      },
    );
  }
}
