import 'package:flutter/material.dart';
import 'package:wasteless/screens/welcome.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            SizedBox(height: 20),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Icon(Icons.facebook, color: Colors.white),
              label: Text('Sign up with FACEBOOK',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Image.asset('assets/google_logo.png', height: 15),
              label:
                  Text('Sign Up GOOGLE', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 40),
            Text('or SIGN UP WITH EMAIL', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                suffixIcon: Icon(Icons.check, color: Colors.green),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                suffixIcon: Icon(Icons.check, color: Colors.green),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text('I have read the '),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'privacy policy.',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
