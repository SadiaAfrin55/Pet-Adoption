
import 'package:flutter/material.dart';

import '../../../Constants/Strings/app_string.dart';
class SkipBtn extends StatefulWidget {
  const SkipBtn({Key? key}) : super(key: key);

  @override
  _SkipBtnState createState() => _SkipBtnState();
}

class _SkipBtnState extends State<SkipBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, THIRD_PAGE);
      },
      child: Container(
        width: 115,
        height: 29,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFDD99)
        ),
        child: Center(
          child: Text('Skip',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 5,
            color: const Color(0xFF000000).withOpacity(0.4),
          ),),
        ),
      ),
    );
  }
}
