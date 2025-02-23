import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100, // Light green background
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Profile Image
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with actual image
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

              const SizedBox(height: 10),

              // Wasteless Points
              Text(
                '💲 320 Wasteless Points',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),

              const SizedBox(height: 20),

              // Settings Section
              _buildSectionTitle("Settings"),
              _buildListTile(Icons.person_outline, "About me"),
              _buildListTile(Icons.favorite_border, "My Favorites"),
              _buildListTile(Icons.location_on_outlined, "My Address"),
              _buildListTile(Icons.sync_alt, "Exchange Wasteless Points"),
              _buildListTile(Icons.notifications_none, "Notifications"),

              const SizedBox(height: 10),

              // Other Section
              _buildSectionTitle("Other"),
              _buildListTile(Icons.info_outline, "Version",
                  trailing: const Text("1.0.0",
                      style: TextStyle(color: Colors.grey))),
              _buildListTile(Icons.star_border, "Rate us"),
              _buildListTile(Icons.logout, "Sign out",
                  iconColor: Colors.red, textColor: Colors.red),
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
  Widget _buildListTile(IconData icon, String title,
      {Widget? trailing,
      Color iconColor = Colors.black,
      Color textColor = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: GoogleFonts.poppins(color: textColor)),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {}, // Add navigation function here
    );
  }
}
