import 'package:flutter/material.dart';
import 'package:wasteless/components/button.dart';
import 'package:wasteless/screens/exchange.dart';

class ExchangeDetailPage extends StatelessWidget {
  const ExchangeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exchanges = [
      {
        'image': 'assets/ech.png',
        'name': 'Magasin Général',
        'description': 'Convert Wastless Points into MG Coupons',
        'points': '1,000',
      },
    ];
    final exchange = exchanges[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExchangePage()),
            );
          },
        ),
        title: const Text(
          'Exchange',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                exchange['image'],
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text(
              exchange['name'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset("assets/money.png", width: 20),
                const SizedBox(width: 8),
                Text(
                  '${exchange['points']} Wastless Points',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'There is good news! Now you can exchange your Wastless Points with a coupon. Hurry up and exchange now!',
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'MG Card Number*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Text('This is my MG Number'),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              'Remaining +${exchange['points']} to exchange',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Your Wasteless Points: +${exchange['points']} ',
            ),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                  text: "Exchange",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExchangePage()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
