import 'package:flutter/material.dart';
import 'package:todo_kvant/src/common/common.dart';

const TextStyle taskTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(tdGrey),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
);
