import 'package:faith_connect/screens/faith_hope_love_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  final List<Map<String, String>> devotionals = [
    {"title": "Today", "date": "November 18, 2024", "image": "assets/today.jpg"},
    {"title": "Tomorrow", "date": "November 19, 2024", "image": "assets/tomorrow.jpg"},
    {"title": "Wednesday", "date": "November 20, 2024", "image": "assets/wednesday.jpg"},
    {"title": "Thursday", "date": "November 21, 2024", "image": "assets/thursday.jpg"},
    {"title": "Friday", "date": "November 22, 2024", "image": "assets/friday.jpg"},
    {"title": "Saturday", "date": "November 23, 2024", "image": "assets/saturday.jpg"},
    {"title": "Sunday", "date": "November 24, 2024", "image": "assets/sunday.jpg"},
  ];

  final List<Widget> _screens = [
    HomeTab(), 
    DiscoverTab(), 
    DiaryTab(), 
    RemindersTab(), 
    ProfileTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavItem(Icons.home, "Home"),
          _buildNavItem(Icons.search, "Discover"),
          _buildNavItem(Icons.book, "Diary"),
          _buildNavItem(Icons.alarm, "Reminders"),
          _buildNavItem(Icons.person, "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon ,size: 28),
      label: label,
    );
  }
}

// 📌 Home Screen (with Devotionals)
class HomeTab extends StatelessWidget {
  final List<Map<String, String>> devotionals = [
    {"title": "Today", "date": "November 18, 2024", "image": "assets/today.jpg"},
    {"title": "Tomorrow", "date": "November 19, 2024", "image": "assets/tomorrow.jpg"},
    {"title": "Wednesday", "date": "November 20, 2024", "image": "assets/wednesday.jpg"},
    {"title": "Thursday", "date": "November 21, 2024", "image": "assets/thursday.jpg"},
    {"title": "Friday", "date": "November 22, 2024", "image": "assets/friday.jpg"},
    {"title": "Saturday", "date": "November 23, 2024", "image": "assets/saturday.jpg"},
    {"title": "Sunday", "date": "November 24, 2024", "image": "assets/sunday.jpg"},
  ];

   HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
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
      child: SizedBox(
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

///discover screen//////////////////////////////////////////////////////////////////////////////////////////////////////////

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/discover.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "RELIGIOUS AND LITURGICAL MUSIC VIDEOS",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiturgicalMusicScreen(),
                      ),
                    );
                  },
                  child: _buildCategoryCard(
                    "Selected Bulacan Liturgical\n Music for Meditation",
                    "assets/meditation.jpg",
                    true,
                    context,
                  ),
                ),
                _buildCategoryCard(
                  "Religious and Inspirational Videos",
                  "assets/religious.jpg",
                  false,
                  context,
                ),
                _buildCategoryCard(
                  "The Lord Is My Chef",
                  "assets/reflection.jpg",
                  false,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath, bool hasSubCategories, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
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
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (hasSubCategories) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSubCategory("ICON", "assets/none.jpg", context),
                    _buildSubCategory("SA IYONG TAHANAN", "assets/none.jpg", context),
                    _buildSubCategory("LITURGICAL SONGS", "assets/none.jpg", context),
                    _buildSubCategory("FAITH, HOPE, LOVE", "assets/religious.jpg", context),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSubCategory(String title, String imagePath, BuildContext context) {
  return GestureDetector(
     onTap: () {
        if (title == "ICON") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => IconCategoryScreen()));
        } else if (title == "SA IYONG TAHANAN") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SaIyongTahananScreen()));
        } else if (title == "LITURGICAL SONGS") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LiturgicalSongsScreen()));
        } else if (title == "FAITH HOPE LOVE") {         
          Navigator.push(context, MaterialPageRoute(builder: (context) => FaithHopeLoveScreen()));
        }
      },

    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
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
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class LiturgicalMusicScreen extends StatelessWidget {
  const LiturgicalMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulacan Liturgical Music for Meditation"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
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
    );
  }

  Widget _buildMusicItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////
///



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class IconCategoryScreen extends StatelessWidget {
  const IconCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ICON"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/profilebg.jpg"), // Ensure this file exists
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search videos",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "SWIPE FOR MORE VIDEOS",
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 200,
                child: Image.asset("assets/thumbnail.jpg"),
              ),
              SizedBox(height: 5),
              Text(
                "Awit Ng Pagbabago",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
class SaIyongTahananScreen extends StatelessWidget {
  const SaIyongTahananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SA IYONG TAHANAN"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/profilebg.jpg"), // Ensure this file exists
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search videos",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "SWIPE FOR MORE VIDEOS",
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 200,
                child: Image.asset("assets/thumbnail.jpg"),
              ),
              SizedBox(height: 5),
              Text(
                "ALAY NA LAAN",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////


class LiturgicalSongsScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {"title": "ABA GINOO MARIA", "image": "assets/liturgicalSongs.jpg"},
    {"title": "BANAL NA DIYOS", "image": "assets/liturgicalSongs.jpg"},
    {"title": "KAPAYAPAAN", "image": "assets/liturgicalSongs.jpg"},
    {"title": "MARIA INANG GABAY", "image": "assets/liturgicalSongs.jpg"},
    {"title": "PAANO KA HESUS?", "image": "assets/liturgicalSongs.jpg"},
     {"title": "Pag-isahin sa Pag-ibig", "image": "assets/liturgicalSongs.jpg"},
      {"title": "Pag-papalang Wagas", "image": "assets/liturgicalSongs.jpg"},
       {"title": "Pagtalima", "image": "assets/liturgicalSongs.jpg"},
        {"title": "Pumanatag Na", "image": "assets/liturgicalSongs.jpg"},
         {"title": "Sa Iyong Tahanan", "image": "assets/liturgicalSongs.jpg"},
  ];

  LiturgicalSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LITURGICAL SONGS"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.black.withOpacity(0.3),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget buildSubCategory(String title, String imagePath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (title == "ICON") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => IconCategoryScreen()));
      } else if (title == "SA IYONG TAHANAN") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SaIyongTahananScreen()));
      } else if (title == "LITURGICAL SONGS") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LiturgicalMusicScreen()));
      } else if (title == "FAITH HOPE LOVE") {         
        Navigator.push(context, MaterialPageRoute(builder: (context) => FaithHopeLoveScreen()));
      }
     
    },

    child: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
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
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}




// 📖 Devotionals Screen///////////////////////////////////////////////////////////////////////////////////////////////////////////////
class DiaryTab extends StatelessWidget {
  const DiaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of devotionals
    final List<Map<String, String>> devotionals = [
      {
        "date": "November 18, 2024",
        "author": "Isaiah Litao",
        "reflection": "My reflection is about faith and perseverance in times of struggle..."
      },
      {
        "date": "November 17, 2024",
        "author": "John Bonula",
        "reflection": "Trusting God even when things seem uncertain is key to a strong faith..."
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("📖 Devotionals")),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/profiles.jpg", // Change this to your image path
              fit: BoxFit.cover,
            ),
          ),
          
          // Dark Overlay for better readability
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
            ),
          ),

          // Devotionals List
          ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: devotionals.length,
            itemBuilder: (context, index) {
              final devotional = devotionals[index];

              return Card(
                color: Colors.white.withOpacity(0.9), // Semi-transparent background
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${devotional['date']} | ${devotional['author']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        devotional['reflection']!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class RemindersTab extends StatefulWidget {
  const RemindersTab({super.key});

  @override
  _RemindersTabState createState() => _RemindersTabState();
}

class _RemindersTabState extends State<RemindersTab> {
  // Switch states for reminders
  bool isAngelusNoonOn = true;
  bool isThreeOClockPrayerOn = true;
  bool isAngelusEveningOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // ✅ Ensures no unwanted black areas
      body: Stack(
        children: [
          // ✅ Full-Screen Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/reminders.jpg", // Ensure the path is correct
              fit: BoxFit.cover, // ✅ Ensures full coverage of the screen
            ),
          ),

          // ✅ SafeArea for Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // ✅ Centers the content
              children: [
                const Text(
                  "Scheduled Notifications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 3)],
                  ),
                ),

                const SizedBox(height: 20),

                // ✅ Centered Reminder List Container
                Center(child: _buildReminderContainer()),

                const SizedBox(height: 20),

                const Text(
                  "Reminders List",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                  ),
                ),

                const SizedBox(height: 10),

                // Set a Reminder Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // TODO: Implement "Set A Reminder" Functionality
                  },
                  child: const Text("+ Set A Reminder", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reminder Card UI
  Widget _buildReminderContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
      ),
      child: Column(
        children: [
          _buildReminderSwitch("Angelus 12:00 PM", isAngelusNoonOn, (value) {
            setState(() {
              isAngelusNoonOn = value;
            });
          }),
          _buildReminderSwitch("3 O'Clock Prayer", isThreeOClockPrayerOn, (value) {
            setState(() {
              isThreeOClockPrayerOn = value;
            });
          }),
          _buildReminderSwitch("Angelus 6:00 PM", isAngelusEveningOn, (value) {
            setState(() {
              isAngelusEveningOn = value;
            });
          }),
        ],
      ),
    );
  }

  // Switch List Item
  Widget _buildReminderSwitch(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black), // ⬅ Text is black
          ),
          Switch(
            value: value,
            activeColor: Colors.amber,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
////////////////////////////////////////////////////////////////////////////////////////////////////
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ✅ Full-Screen Background Image
        Positioned.fill(
          child: Image.asset(
            "assets/profile.jpg", // Replace with your actual image path
            fit: BoxFit.cover, // ✅ Ensures the image covers the whole screen
          ),
        ),

        // ✅ Centered Profile Content
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), // Slightly transparent for visibility
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(2, 2)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Profile Image
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),

                // ✅ User Information
                _buildInfoRow("Name:", "Isaiah"),
                _buildInfoRow("Email:", "Isaiah@gmail.com"),
                _buildInfoRow("Municipality:", "Bulakan"),
                _buildInfoRow("Parish:", "Our Lady Fatima Parish"),

                const SizedBox(height: 15),

                // About Section Title
                const Text(
                  "ABOUT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                const SizedBox(height: 10),

                // About Section Items
                _buildListItem(Icons.info, "About Us"),
                _buildListItem(Icons.security, "Privacy Policy"),
                _buildListItem(Icons.article, "Terms and Conditions"),

                const SizedBox(height: 20),

                // ✅ Logout Button with Navigation to Login Screen
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // Navigate to Login Screen and Remove Previous Screens
                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("LOG OUT"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ✅ Widget for User Info Rows
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ✅ Widget for List Items
  Widget _buildListItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      onTap: () {
        // TODO: Implement Navigation to Pages
      },
    );
  }
}


// 📖 Devotional Detail Screen//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class DevotionalDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  final String image;

  const DevotionalDetailScreen({super.key, 
    required this.title,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, size: 50, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  date,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Text(
                  "This is a sample devotional text. Replace this with actual content.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
