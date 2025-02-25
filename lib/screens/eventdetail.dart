import 'package:flutter/material.dart';
import 'package:wasteless/screens/events.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventsPage()),
            );
          },
        ),
        title: const Text(
          'Event',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Avenue Habib Bourguiba Clean-up Campaign',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '23 November 2023',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/Event1.png', // Replace with actual URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tunis',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Avenue Habib Bourguiba Clean-Up Day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Join us for a day of community collaboration as we come together to enhance the beauty and cleanliness of Avenue Habib Bourguiba, one of Tunis’s iconic landmarks. This cleanup event is a collective effort to make a positive impact on our environment and foster a sense of pride in our community.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _sectionTitle('Activities'),
            _activityItem('Trash Collection',
                'Volunteers will be provided with gloves, bags, and other necessary materials to collect litter along the avenue. We encourage participants to focus on areas such as sidewalks, gardens, and public spaces.'),
            _activityItem('Beautification Projects',
                'In addition to cleaning up litter, we’ll have teams working on beautification projects, such as painting benches, planting flowers, and enhancing public spaces.'),
            _activityItem('Educational Booths',
                'Set up informative booths along the avenue to educate participants on environmental protection and waste reduction.'),
            _activityItem('Community Bonding',
                'Foster a sense of community by encouraging interaction among participants. Consider organizing group activities, workshops, or a small celebratory gathering after the cleanup to acknowledge everyone’s efforts.'),
            const SizedBox(height: 16),
            _sectionTitle('How to Participate'),
            _bulletPoint(
                'Individuals, families, community groups, and businesses are all welcome.'),
            _bulletPoint('Register online or on-site on the day of the event.'),
            _bulletPoint(
                'Bring comfortable clothing, water bottles, and enthusiasm.'),
            const SizedBox(height: 16),
            _sectionTitle('Benefits'),
            _bulletPoint(
                'Environmental Impact: By cleaning up Avenue Habib Bourguiba, we contribute to a healthier and more sustainable environment.'),
            _bulletPoint(
                'Community Engagement: The event provides an opportunity for residents to connect, share a common goal, and build a sense of unity.'),
            _bulletPoint(
                'Aesthetic Improvement: The cleanup helps preserve the visual appeal of the avenue, making it a more enjoyable space for residents and visitors.'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  'Event Link',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _activityItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
