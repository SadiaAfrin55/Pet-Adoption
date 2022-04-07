
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../Bloc/Login/login_cubit.dart';
import '../../../Constants/Strings/app_string.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/progress_animated_btn.dart';
import '../../Widgets/TextField/fill_textfield.dart';
import '../../Widgets/TextField/password_textfield.dart';
import '../Home/PetSetup/setup_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emilController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  late bool circule;
  late bool validate;

  ButtonState progressButtonState = ButtonState.idle;

  //local dataBase
  Box? users;
  LoginDataSave? loginDataSave;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users =Hive.box('users');
    loginDataSave=LoginDataSave();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener}
        if(state is LoginUser){
          setState(() {
            progressButtonState = ButtonState.idle;
          });

          final data=(state as LoginUser).login;

          if(data!.status=="fail"){
            // ignore: deprecated_member_use
            print(data.status);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("User id and password are mismatched").tr(),
              ),
            );
          }else{
            loginDataSave?.storeTokenUserdata(users,data.token, data.user!.id, data.user!.name, data.user!.email, data.user!.role,data.user!.employeeId);
            Navigator.pushReplacement(context, PageTransition(PetSetupPage()));
          }

        }
      },
      child: SafeArea(
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Positioned(
                        top: 0,
                        right: 0,
                        child: SvgPicture.asset("assets/icons/up.svg",)),),
                  Positioned(
                    bottom: -48,
                    left: 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SvgPicture.asset("assets/icons/down.svg"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _globalkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width:278,
                                height: 125,
                                child: Stack(
                                  children: [
                                    // Align(
                                    //     alignment: Alignment.topLeft,
                                    //     child: Container(
                                    //       color: Colors.lightBlue,
                                    //         child: Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black.withOpacity(0.5)),))),
                                    Container(
                                        width:278,
                                        height: 125,
                                        child: Lottie.asset("assets/lottie/cat.json")),
                                    // Align(
                                    //     alignment: Alignment.bottomLeft,
                                    //     child: Container(
                                    //         color: Colors.lightGreen,
                                    //         child: Text('PLease sign in to continue',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w300,color: Colors.black.withOpacity(0.5)),))),
                                  ],
                                ),
                              ),
                              //Image.asset('assets/images/catLogin.png'),
                            ],
                          ),
                          MaterialTextField(lable:tr("abcd@gma.com"),readOnly: false,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3),), controller:emilController ,),
                          const SizedBox(height: 12,),
                          MaterialTextField(lable:tr("Name"),readOnly: false,prefIcon: Icon(Icons.person,color: Colors.black.withOpacity(0.3),), controller:nameController ,),
                          const SizedBox(height: 12,),
                          MaterialTextField(lable:tr("Phone"),readOnly: false,prefIcon: Icon(Icons.phone,color: Colors.black.withOpacity(0.3),), controller:phoneController ,),
                          const SizedBox(height: 12,),
                          MaterialTextFieldPassword(lable: tr("Password"),controller:passwordController ,prefIcon: Icon(Icons.lock,color: Colors.black.withOpacity(0.3)),),
                          const SizedBox(height: 12),
                          MaterialTextFieldPassword(lable: tr("Confirm Password"),controller:passwordController ,prefIcon: Icon(Icons.lock,color: Colors.black.withOpacity(0.3)),),
                          const SizedBox(height: 8,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 7),
                            child: ProgressAnimatedButton(text: tr("SignUp"),colors: Color(0xFFffbb33),progressButtonState: progressButtonState,tap: (){
                              if (_globalkey.currentState!.validate()) {
                                setState(() {
                                  validate = true;
                                  progressButtonState = ButtonState.loading;
                                  BlocProvider.of<LoginCubit>(context).logIn(emilController.text,passwordController.text);
                                });
                              }
                            },),
                          ),
                          const SizedBox(height: 21,),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, FORGET_PASSWORD_PAGE);
                              },
                              child:RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: 'Dont’t have an account?  ', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black.withOpacity(0.5))),
                                    TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black.withOpacity(0.5))),
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
