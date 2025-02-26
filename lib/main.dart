import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'sign_up_screen.dart'; // Import SignUpScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faith Connect',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fake user credentials (Replace with Firebase/Auth API)
  final String _dummyEmail = "user";
  final String _dummyPassword = "pass";

  void _signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == _dummyEmail && password == _dummyPassword) {
      // Successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/bg_image.jpg", // Ensure this file exists in assets/
              fit: BoxFit.cover,
            ),
          ),
          // 🔹 Dark Overlay for readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 600,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.church, size: 80, color: Colors.amber),
                    SizedBox(height: 10),
                    Text(
                      "FAITH CONNECT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "-- COMMUNITY AND CONNECTION --",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 20),

                    // Email Input
                    TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Password Input
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) => _signIn(),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 8.0, top: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Sign In Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                      onPressed: _signIn,
                      child: Text("Sign In", style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 10),

                    // Sign Up Link
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign Up here.",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
