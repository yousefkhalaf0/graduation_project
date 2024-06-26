import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../../../core/utilities/constants.dart';
import '../../../../../../core/utilities/controllers.dart';

class EmailOTP extends StatelessWidget {
  const EmailOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context,
                    AppRoutes.forgetByEmailScreenRoute, (route) => false);
              },
              icon: SizedBox(
                  height: 24.h,
                  child: Image.asset('assets/images/icons/img.png'))),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, right: 16.w, left: 16.w),
            child: Form(
              key: emailOTPFormKey,
              child: Column(
                children: [
                  Text(
                    'Enter verification code',
                    style:
                        TextStyle(fontSize: 24.sp, fontFamily: 'Lato-Bold.ttf'),
                  ),
                  SizedBox(height: 8.h),
                  FittedBox(
                    child: Text(
                      'We sent an email to ${forgetByEmailController.text}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Lato-Light.ttf',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 46.h),
                  PinCodeTextField(
                    autoFocus: true,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    backgroundColor: Colors.transparent,
                    appContext: context,
                    length: 4,
                    blinkDuration: const Duration(milliseconds: 300),
                    obscureText: true,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.scale,
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    // enableActiveFill: true,
                    // controller: emailOTPController,
                    keyboardType: TextInputType.number,
                    errorTextMargin: EdgeInsets.only(left: 100.w),
                    errorTextSpace: 50.sp,
                    validator: (v) {
                      if (v!.length < 4) {
                        return 'Enter the verification code well';
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 50.h,
                      fieldWidth: 43.w,
                      selectedColor: const Color(0xffFFA09D),
                      activeColor: const Color(0xffFFA09D),
                      inactiveColor: const Color(0xffFFA09D),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      text: 'Didn’t receive the code? ',
                      style: TextStyle(
                        fontFamily: 'Lato-Regular.ttf',
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                      children: [
                        TextSpan(
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const CreateNewPass()),
                          //   ),
                          text: 'Resend in 58',
                          style: TextStyle(
                            fontFamily: 'Lato-Regular.ttf',
                            color: const Color(0xff1C6E97),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
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
                        if (emailOTPFormKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, AppRoutes.createNewPassScreenRoute);
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
                          'Verify',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Lato',
                              color: const Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
