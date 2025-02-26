import 'package:flutter/material.dart';
import 'package:wasteless/screens/home.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rankings = [
      {'name': 'Foulen Foulani', 'points': 520},
      {'name': 'Foulen Foulani', 'points': 490},
      {'name': 'Foulen Foulani', 'points': 420},
      {'name': 'Foulen Foulani', 'points': 320},
      {'name': 'Foulen Foulani', 'points': 255},
      {'name': 'Foulen Foulani', 'points': 250},
      {'name': 'Foulen Foulani', 'points': 100},
      {'name': 'Foulen Foulani', 'points': 0},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Ranking',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          DropdownButton<String>(
            value: 'Ariana',
            onChanged: (String? newValue) {},
            items: ['Ariana', 'Tunis', 'Sfax', 'Sousse']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: rankings.length,
          itemBuilder: (context, index) {
            final rank = rankings[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  title: Text('${index + 1}. ${rank['name']}'),
                  trailing: Text(
                    '${rank['points']} pts',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
