
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/Button/skip_btn.dart';
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEB76FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/care.png'),
          const SizedBox(height: 93),
          Text('Find Your Dream Pet Here',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontFamily: 'DancingScript',
                color: Colors.black.withOpacity(0.8)),
          ),
          const SizedBox(height: 26),
          const Text('Lorem Ipsum has been the industrys standard',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 98),
          SkipBtn(),
        ],
      ),
    );
  }
}
