import 'package:flutter/material.dart';

class CustomDialogManager{
  //static 함수로 만든다
  //어디서든 사용가능하도록
  static Widget createAlert(BuildContext context, String title, String message, VoidCallback onConfirm){
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed:(){Navigator.of(context).pop();},
            child: Text('확인')),
        TextButton(
            onPressed:(){Navigator.of(context).pop();},
            child: Text('취소'))
      ],

    );

  }

}