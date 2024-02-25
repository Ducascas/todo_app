import 'package:flutter/material.dart';

taskStatusWidget(bool? isStatus) {

  return isStatus ?? false
      ? const Icon(Icons.check_box)
      : const Icon(Icons.check_box_outline_blank);
}
