import 'dart:async';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Constants/Strings/app_string.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Pages/Home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  //storage instance
  LocalDataGet _localDataGet=new LocalDataGet();


  String page =HOME_PAGE;
  bool isLogin=false;

  void checkLogin() async {
    var token=await _localDataGet.getData();

    if (token.get('token') != null) {
      setState(() {
        isLogin=true;
      });
    } else {
      setState(() {
        isLogin=false;
        page =LOGIN_PAGE;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    checkLogin();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });
    _controller.forward();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 8.06;
      });
    });
    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });
    Timer(Duration(seconds: 4), () {
      setState(() {
        isLogin?
        Navigator.pushReplacement(context, PageTransition(HomePage())): Navigator.pushReplacementNamed(
            context, LOGIN_PAGE);
      });
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    // context.locale=Locale('en', 'US');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Splash.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Adopt Box",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Color(0xFFFFDD99))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition(this.page) : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}
class PageTransition1 extends PageRouteBuilder {
  final Widget page;
  PageTransition1(this.page) : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}
