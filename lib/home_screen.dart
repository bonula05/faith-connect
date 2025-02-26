import 'package:flutter/material.dart';
import 'devotional_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> devotionals = [
    {"title": "Today", "date": "November 18, 2024", "image": "assets/today.jpg"},
    {"title": "Tomorrow", "date": "November 19, 2024", "image": "assets/tomorrow.jpg"},
    {"title": "Wednesday", "date": "November 20, 2024", "image": "assets/wednesday.jpg"},
    {"title": "Thursday", "date": "November 21, 2024", "image": "assets/thursday.jpg"},
    {"title": "Friday", "date": "November 22, 2024", "image": "assets/friday.jpg"},
    {"title": "Saturday", "date": "November 23, 2024", "image": "assets/saturday.jpg"},
    {"title": "Sunday", "date": "November 24, 2024", "image": "assets/sunday.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "FAITH CONNECT",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: _buildBackgroundImage()),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(child: _buildDevotionalList(context, screenWidth)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/home.jpg",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.black,
        child: const Center(
          child: Icon(Icons.error, color: Colors.red, size: 50),
        ),
      ),
    );
  }

  Widget _buildDevotionalList(BuildContext context, double screenWidth) {
    return Center(
      child: Container(
        width: screenWidth > 700 ? 600 : screenWidth * 0.9,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemCount: devotionals.length,
          itemBuilder: (context, index) => _buildDevotionalCard(context, devotionals[index]),
        ),
      ),
    );
  }

  Widget _buildDevotionalCard(BuildContext context, Map<String, String> devotional) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DevotionalDetailScreen(
              title: devotional["title"]!,
              date: devotional["date"]!,
              image: devotional["image"]!,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                devotional["image"]!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.black54),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                devotional["title"]!,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 15,
              child: Text(
                devotional["date"]!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
