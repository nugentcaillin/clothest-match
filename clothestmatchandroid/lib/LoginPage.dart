import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SignInScreen(),
        ]),
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, -0.98),
              end: Alignment(0.21, 0.98),
              colors: [Color(0xFFD2F6FE), Colors.white, Color(0xFFFEFCFD), Color(0xFFFBEAF0)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 101.44,
                top: 378.56,
                child: Container(width: 38.40, height: 45.11),
              ),
              Positioned(
                left: 44.67,
                top: 510.56,
                child: Container(
                  width: 303.32,
                  height: 70, // Adjustedheight to accommodate more lines
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 303.32,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By tapping Create Account or Sign In, you agree to ',
                                  style: TextStyle(
                                    color: Color(0xB269819C),
                                    fontSize: 12.43,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'our Terms. ',
                                  style: TextStyle(
                                    color: Color(0xB269819C),
                                    fontSize: 12.43,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Learn how we process your data in our ',
                                  style: TextStyle(
                                    color: Color(0xB269819C),
                                    fontSize: 12.43,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy and Cookies Policy.',
                                  style: TextStyle(
                                    color: Color(0xB269819C),
                                    fontSize: 12.43,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30.57,
                top: 591.52,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 331.53,
                        height: 50.25,
                        padding: const EdgeInsets.symmetric(horizontal: 83.30, vertical: 16.12),
                        decoration: ShapeDecoration(
                          color: Color(0xFF69819C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(67.18),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN IN WITH APPLE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.75),
                      Container(
                        width: 331,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 83.30, vertical: 16.12),
                        decoration: ShapeDecoration(
                          color: Color(0xFF69819C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(67.18),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN IN WITH FACEBOOK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.75),
                      Container(
                        width: 331.53,
                        padding: const EdgeInsets.symmetric(horizontal: 83.30, vertical: 16.12),
                        decoration: ShapeDecoration(
                          color: Color(0xFF69819C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(67.18),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SIGN IN WITH PHONE NUMBER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 132.34,
                top: 783.98,
                child: Text(
                  'Trouble Signing In?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF69819C),
                    fontSize: 14.11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                ),
              ),
              Positioned(
                left: 61,
                top: 346,
                child: Container(
                  width: 272,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 108.06,
                          height: 110.03,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 16.30,
                                height: 9.84,
                                child: Stack(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}