import 'package:flutter/material.dart';
import 'package:wasteless/screens/register.dart';
import 'package:wasteless/screens/welcome.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 60),
            Image(image: AssetImage('assets/logo_vert.png')),
            SizedBox(height: 10),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Icon(Icons.facebook, color: Colors.white),
              label: Text('Login with FACEBOOK',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Image.asset('assets/google_logo.png', height: 15),
              label: Text('Login with GOOGLE',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 30),
            Text('or LOGIN WITH EMAIL', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Forgot your password?',
                  style: TextStyle(color: Colors.grey)),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text("You don't have an account yet? Sign up",
                  style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}
