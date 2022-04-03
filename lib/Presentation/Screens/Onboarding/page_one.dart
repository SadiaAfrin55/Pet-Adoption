
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption/Presentation/Widgets/Button/skip_btn.dart';
class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE75D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/find.png'),
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
