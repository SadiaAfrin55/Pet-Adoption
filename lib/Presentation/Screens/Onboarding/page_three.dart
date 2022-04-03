
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Strings/app_string.dart';
import '../../Widgets/Button/skip_btn.dart';
class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2EBFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/love.png'),
          const SizedBox(height: 93),
          Text('Find Your Dream Pet Here',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
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
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, LOGIN_PAGE);
              },
              child: Text('next')),
        ],
      ),
    );
  }
}
