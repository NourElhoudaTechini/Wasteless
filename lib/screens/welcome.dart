import 'package:flutter/material.dart';
import 'package:wasteless/components/button.dart';
import 'package:wasteless/screens/login.dart';
import 'package:wasteless/screens/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(
                  context: context,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.green,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/logo.png'),
              SizedBox(height: 20),
              Text(
                'WASTELESS',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 90),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Care about waste processing\nCare about the future',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Sign in',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      isFilled: true,
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      text: 'Sign up',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      isFilled: false,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'By logging in or registering, you agree to our \nTerms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  final radius = 10.0;

  // ignore: prefer_typing_uninitialized_variables
  final context;

  const CustomClipPath({
    required this.context,
  }) : super();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, MediaQuery.sizeOf(context).height / 2.2);
    path.lineTo(MediaQuery.sizeOf(context).width, 500);
    path.lineTo(MediaQuery.sizeOf(context).width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
