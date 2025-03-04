import 'package:flutter/material.dart';

class FaithHopeLoveScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {"title": "Amazing Grace", "image": "assets/images/amazing_grace.jpg"},
    {"title": "How Great Thou Art", "image": "assets/images/how_great.jpg"},
  ];

  FaithHopeLoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faith Hope Love"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: songs.isEmpty
            ? const Center(
                child: Text(
                  "No songs available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return _buildSongItem(
                    song["title"] ?? "Untitled", 
                    song["image"] ?? "assets/images/placeholder.jpg",
                  );
                },
              ),
      ),
    );
  }

  Widget _buildSongItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          // Add navigation or action here
        },
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 140,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text("Image not found", style: TextStyle(color: Colors.black54)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
