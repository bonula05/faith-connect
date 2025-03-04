import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, size: 80, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                "John Doe", // Placeholder Name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("john.doe@example.com", style: TextStyle(color: Colors.black54)), // Placeholder Email
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.location_city, color: Colors.blue),
                title: Text("Municipality: Sample City"),
              ),
              ListTile(
                leading: Icon(Icons.church, color: Colors.blue),
                title: Text("Parish: St. John Parish"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info, color: Colors.blue),
                title: Text("About Us"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip, color: Colors.blue),
                title: Text("Privacy Policy"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.article, color: Colors.blue),
                title: Text("Terms and Conditions"),
                onTap: () {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.pop(context); // Goes back to the previous screen
                },
                child: Text("LOG OUT", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
