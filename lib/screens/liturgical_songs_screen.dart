import 'package:flutter/material.dart';

class LiturgicalSongsScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {"title": "ABA GINOO MARIA", "image": "assets/maria1.jpg"},
    {"title": "BANAL NA DIYOS", "image": "assets/jesus1.jpg"},
    {"title": "KAPAYAPAAN", "image": "assets/dove.jpg"},
    {"title": "MARIA INANG GABAY", "image": "assets/mary2.jpg"},
    {"title": "PAANO KA HESUS?", "image": "assets/prayer.jpg"},
  ];

   LiturgicalSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liturgical Songs"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return _buildSongItem(songs[index]["title"]!, songs[index]["image"]!);
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.asset(imagePath, width: double.infinity, height: 140, fit: BoxFit.cover),
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
                  style: TextStyle(
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
