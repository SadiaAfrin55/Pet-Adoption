
import 'package:flutter/material.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/onboarding_page.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_one.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_three.dart';
import 'package:pet_adoption/Presentation/Screens/Onboarding/page_two.dart';

import '../Bloc/Login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/User/user_cubit.dart';
import '../Constants/Strings/app_string.dart';
import '../Presentation/Pages/Home/PetSetup/setup_page.dart';
import '../Presentation/Pages/Home/home_page.dart';
import '../Presentation/Pages/Login/login_page.dart';
import '../Presentation/Pages/Signup/signup_page.dart';
import '../Presentation/Screens/ForgetPassword/forget_password_page.dart';
import '../Presentation/Screens/SplashScreen/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: HomePage(),
            ));
      case ONBOARDING_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: OnboardingPage(),
            ));
      case FIRST_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: PageOne(),
            ));
      case SECOND_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: PageTwo(),
            ));
      case THIRD_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: PageThree(),
            ));
      case LOGIN_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ));
      case SIGNUP_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: SignupPage(),
            ));
      case SETUP_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: PetSetupPage(),
            ));
      case FORGET_PASSWORD_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ForgetPassword(),
            ));
        case DETAILES_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ForgetPassword(),
            ));

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: Container(),
            ));
    }
  }
}