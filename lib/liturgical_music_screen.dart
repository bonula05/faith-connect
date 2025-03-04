import 'package:flutter/material.dart';

class LiturgicalMusicScreen extends StatelessWidget {
  const LiturgicalMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Bulacan Liturgical Music"),
        backgroundColor: Colors.brown[800], // Adjust color to fit theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Categories Section (Horizontally Scrollable)
            Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSubCategory(context, "ICON", "assets/icon.jpg"),
                    _buildSubCategory(context, "SA IYONG TAHANAN", "assets/home.jpg"),
                    _buildSubCategory(context, "LITURGICAL SONGS", "assets/liturgical.jpg"),
                    _buildSubCategory(context, "FAITH, HOPE, LOVE", "assets/faith.jpg"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Songs List (Scrollable ListView)
            Expanded(
              child: ListView(
                children: [
                  _buildMusicItem("AMA NAMIN", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("ANG AKING BUHAY PARA SA AKING KAWAN", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("DAKILA KA, O PANGINOON", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("KRISTO, DAAN NG BUHAY", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("NASA TABI KO ANG PANGINOON", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("PAGGUGUNITA", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("SALMON 23", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("SALMON 27", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("UMAASA KA SA DIYOS", "assets/liturgicalbg.jpg"),
                  _buildMusicItem("UNANG ALAY", "assets/liturgicalbg.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Sub-category Item (With Correct Navigation)
  Widget _buildSubCategory(BuildContext context, String title, String imagePath) {
  return GestureDetector(
    onTap: () {
      if (title == "ICON") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => IconCategoryScreen()));
      } else if (title == "SA IYONG TAHANAN") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaIyongTahananScreen()));
      } else if (title == "LITURGICAL SONGS") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LiturgicalSongsScreen()));
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

  // ✅ List Item for Songs
  Widget _buildMusicItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, width: 120, height: 80, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Dummy Screens for Navigation
class IconCategoryScreen extends StatelessWidget {
  const IconCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ICON Category")),
      body: Center(child: Text("ICON Content Here")),
    );
  }
}

class SaIyongTahananScreen extends StatelessWidget {
  const SaIyongTahananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sa Iyong Tahanan")),
      body: Center(child: Text("Sa Iyong Tahanan Content Here")),
    );
  }
}

// ✅ New Screen for "LITURGICAL SONGS"
class LiturgicalSongsScreen extends StatelessWidget {
  const LiturgicalSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liturgical Songs")),
      body: Center(child: Text("Liturgical Songs Content here")),
    );
  }
}

// ✅ New Screen for "FAITH HOPE LOVE"
class FaithHopeLoveScreen extends StatelessWidget {
  const FaithHopeLoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aith Hope Love")),
      body: Center(child: Text("Faith Hope Love Content here")),
    );
  }
}


       