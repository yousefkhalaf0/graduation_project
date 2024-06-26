import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utilities/enums.dart';
import '../../../../../../core/database/local_database/cache.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../../../core/utilities/constants.dart';
import '../../../../../../core/utilities/controllers.dart';
import '../../../../../../core/utilities/functions.dart';

class ForgetByEmail extends StatelessWidget {
  const ForgetByEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.loginScreenRoute, (route) => false);
            },
            icon: SizedBox(
                height: 24.h,
                child: Image.asset('assets/images/icons/img.png'))),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
          child: Form(
            key: forgetByEmailFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Forget Password',
                    style:
                        TextStyle(fontSize: 24.sp, fontFamily: 'Lato-Bold.ttf'),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    'Enter your email address to reset password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Lato-Light.ttf',
                        color: Colors.grey),
                  ),
                ),
                SizedBox(height: 64.h),
                TextFormField(
                  controller: forgetByEmailController,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!isValidEmail(email)) {
                      return 'Please enter a valid email';
                    }
                    //
                    if (MyShared.getString(key: MySharedKeys.email) != '' &&
                        MyShared.getString(key: MySharedKeys.email) != email) {
                      return 'This email is not registered';
                    }
                    //
                    return null;
                  },
                  style:
                      TextStyle(fontSize: 16.sp, fontFamily: 'Lato-Light.ttf'),
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 10.sp, fontFamily: 'Lato-Light.ttf'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r)),
                      hintText: 'Email address',
                      hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                          fontFamily: 'Lato-Light.ttf')),
                ),
                SizedBox(height: 8.h),
                RichText(
                    text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(
                        context, AppRoutes.forgetByPhoneScreenRoute),
                  text: 'Reset with phone number',
                  style: TextStyle(
                    fontFamily: 'Lato-Regular.ttf',
                    color: const Color(0xffFFA09D),
                    fontSize: 14.sp,
                  ),
                )),
                SizedBox(height: 24.h),
                Center(
                    child: Container(
                  width: 396.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff1C6E97),
                        Color(0xff408AAF),
                        Color(0xff1C6E97)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (forgetByEmailFormKey.currentState!.validate() &&
                          MyShared.getString(key: MySharedKeys.email) ==
                              forgetByEmailController.text) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            AppRoutes.emailOTPScreenRoute, (route) => false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                    ),
                    child: FittedBox(
                      child: Text(
                        'Send verification code',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Lato',
                            color: const Color(0xffFFFFFF)),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
