import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/sign_up_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _dummyEmail = "user";
  final String _dummyPassword = "pass";

  void _signIn() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == _dummyEmail && password == _dummyPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
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
    double bottomPadding = MediaQuery.of(context).viewInsets.bottom; 

    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Fullscreen Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/front.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.black,
                child: Center(
                  child: Icon(Icons.error, color: Colors.red, size: 50),
                ),
              ),
            ),
          ),

          // 🔹 Dark overlay for readability
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          // 🔹 Adjust position only when keyboard appears
          AnimatedPadding(
            duration: Duration(milliseconds: 300), // Smooth animation
            padding: EdgeInsets.only(top: bottomPadding > 0 ? 300 : 410), // Adjust only on focus
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 350,
                height: 330, // Fixed height
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 🔹 Email Field
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          isDense: true,
                        ),
                      ),
                    ),

                    // 🔹 Password Field
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          isDense: true,
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
                    ),

                    // 🔹 Sign In Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                      ),
                      onPressed: _signIn,
                      child: Text("Sign In", style: TextStyle(color: Colors.black)),
                    ),

                    // 🔹 Sign Up Link
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign Up here.",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
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
