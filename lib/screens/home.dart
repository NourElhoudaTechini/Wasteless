import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:wasteless/screens/events.dart';
import 'package:wasteless/screens/maps.dart';
import 'package:wasteless/screens/ranking.dart';
import 'package:wasteless/screens/recycle.dart';
import 'package:wasteless/screens/account.dart';
import 'package:wasteless/screens/scan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation logic (Replace with actual navigation)
    List<Widget> pages = [
      HomeScreen(),
      // Replace with actual MapScreen(),
      CleanUpMapScreen(),
      // Replace with actual RecyclingScreen(),
      RecycleFormPage(),
      // Replace with actual EventsScreen(),
      EventsPage(),
      // Replace with actual AccountScreen(),
      AccountScreen(),
    ];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildPointsSection(),
            SizedBox(height: 40),
            _buildActionGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCutClipper(),
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage("assets/forest.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ProfileScreen(),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning, Nour",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green[800],
                      ),
                    ),
                    Text(
                      "Come on, recycle your waste!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPointsSection() {
    return Column(
      children: [
        Text(
          "Home",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/money.png", width: 30),
            SizedBox(width: 5),
            Text(
              "320 Wasteless Points",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionCard(Icons.recycling, "Recycle", Colors.green[400]!),
              _buildActionCard(Icons.cleaning_services, "Clean\nNeighborhood",
                  Colors.red[300]!),
              _buildActionCard(Icons.event, "Events", Colors.blue[300]!),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionCard(
                  Icons.emoji_events, "Ranking", Colors.amber[300]!),
              const SizedBox(width: 15),
              _buildActionCard(
                  Icons.qr_code, "Object Detection", Colors.grey[400]!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String title, Color color) {
    return GestureDetector(
      onTap: () {
        if (title == "Recycle") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecycleFormPage()),
          );
        } else if (title == "Clean\nNeighborhood") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CleanUpMapScreen()),
          );
        } else if (title == "Events") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventsPage()),
          );
        } else if (title == "Ranking") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RankingPage()),
          );
        } else if (title == "Object Detection") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanObjectScreen()),
          );
        }
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green[700],
      unselectedItemColor: Colors.grey[500],
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.map), label: 'Map'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.recycling, color: Colors.white),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(LucideIcons.calendar), label: 'Events'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Account'),
      ],
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[300],
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null
            ? Icon(Icons.add_a_photo, size: 20, color: Colors.white)
            : null,
      ),
    );
  }
}

class BottomCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 10); // Start from bottom-left
    path.quadraticBezierTo(size.width / 2, size.height - 80, size.width,
        size.height - 10); // Inverted semicircle
    path.lineTo(size.width, 0); // Move to top-right
    path.lineTo(0, 0); // Move to top-left
    path.close(); // Close path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
