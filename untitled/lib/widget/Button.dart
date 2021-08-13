import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   final String text;
   final double w;
   final double h;
   final Function callback;



   const Button({
    required this.text,
    required this.w,
    required this.h,
     required this.callback
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      child: SizedBox(
        width: w,
        height: h,
        child: FlatButton(
          onPressed: () => callback(text),
          child: Text(text),
        ),
      ),
    );
  }
}
