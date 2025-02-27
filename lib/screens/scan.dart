import 'package:flutter/material.dart';

class ScanObjectScreen extends StatelessWidget {
  const ScanObjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light green background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Scan Object",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Scan the object to know its material",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Icon(Icons.lightbulb, size: 40, color: Colors.grey[700]),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/backgroung.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Green scan frame
                  Positioned(
                    top: 50,
                    left: 40,
                    right: 40,
                    bottom: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner, color: Colors.white),
              label: Text("Scan"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
