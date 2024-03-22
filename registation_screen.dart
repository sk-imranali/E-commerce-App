//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// import '../const/app_colors.dart';
// import 'login_screen.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _obscureText = true;

// signUp()async{
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text
//     );
//     var authCredential = userCredential.user;
//     print(authCredential!.uid);
//     if(authCredential.uid.isNotEmpty){
//       Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
//     }
//     else{
//       Fluttertoast.showToast(msg: "Something is wrong");
//     }
//
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       Fluttertoast.showToast(msg: "The password provided is too weak.");
//
//     } else if (e.code == 'email-already-in-use') {
//       Fluttertoast.showToast(msg: "The account already exists for that email.");
//
//     }
//   } catch (e) {
//     print(e);
//   }
// }
//

import 'package:ecommerce/const/app_colors.dart';
import 'package:ecommerce/ui/user_form_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'bottomnavcontroller.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  bool _obscureText = true;
  signUp() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passcontroller.text,
      );

    var authCredential = userCredential.user;
    print(authCredential!.uid);
    if(authCredential.uid.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>UserFormScreen()));
    }
    else{
      Fluttertoast.showToast(msg: "Some thing is wrong");
    }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The account already exists for that email.');

      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150.h,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Welcome Buddy",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.deep_orange),
                    ),
                    Text(
                      "Glad to see you back my buddy",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                              color: AppColors.deep_orange,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Center(
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp, color: Colors.grey),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.deep_orange,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.deep_orange,
                          ),
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _passcontroller,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: "enter your password",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.deep_orange),
                              suffixIcon: _obscureText == true
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        size: 20.w,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.visibility_off,
                                        size: 20.w,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                        width: 1.sw,
                        height: 56.h,
                        child: ElevatedButton(
                          onPressed: () {
                            signUp();
                          },
                          child: Text(
                            "Continuous",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.deep_orange,
                            elevation: 3,
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.deep_orange),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
