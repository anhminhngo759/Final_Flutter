import 'package:flutter/material.dart';

extension AppExtension on State {
    void endEditing(){
      FocusScope.of(context).requestFocus(FocusNode());
    }
}