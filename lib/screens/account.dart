import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasteless/screens/about.dart';
import 'package:wasteless/screens/exchange.dart';
import 'package:wasteless/screens/welcome.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Light grey background
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  // Profile Image
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                            "assets/me.jpeg"), // Replace with actual image
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.green, size: 20),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Name & Username
              Text(
                'Nour Elhouda Techini',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'nourtechini',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Wasteless Points

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/money.png", width: 20),
                  const SizedBox(width: 4),
                  Text(
                    ' 320 Wasteless Points',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Settings Section
              _buildSectionTitle("Settings"),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    _buildListTile(
                      Icons.person_outline,
                      "About me",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutMeScreen()),
                        );
                      },
                    ),
                    _buildListTile(
                        Icons.favorite_border, "My Favorites", () {}),
                    _buildListTile(
                        Icons.location_on_outlined, "My Address", () {}),
                    _buildListTile(Icons.sync_alt, "Exchange Wasteless Points",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExchangePage()),
                      );
                    }),
                    _buildListTile(
                        Icons.notifications_none, "Notifications", () {}),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Other Section
              _buildSectionTitle("Other"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    _buildListTile(
                      Icons.info_outline,
                      "Version",
                      () {},
                      trailing: const Text("1.0.0",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    _buildListTile(Icons.star_border, "Rate us", () {}),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: Text("Sign out",
                          style: GoogleFonts.poppins(color: Colors.red)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  // Function to create list items
  Widget _buildListTile(IconData icon, String title, VoidCallback onTap,
      {Widget? trailing, Color textColor = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title, style: GoogleFonts.poppins(color: textColor)),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap, // Fixed missing function
    );
  }
}
