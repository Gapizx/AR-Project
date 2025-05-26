import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ฉากหลัง
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_fitness.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Colors.black.withOpacity(0.5), // มัวพื้นหลัง
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("POWER", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                Text("FITNESS", style: TextStyle(fontSize: 24, color: Colors.cyan[300], letterSpacing: 1.5)),

                const SizedBox(height: 20),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sign in to track your workouts, set goals, and\nachieve your fitness dreams",
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Email
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),

                // Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: Icon(Icons.visibility, color: Colors.white54),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                  style: TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forgot Password?", style: TextStyle(color: Colors.cyan[200])),
                ),

                const SizedBox(height: 25),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),); // ไป ar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan[400],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("SIGN IN", style: TextStyle(fontSize: 16)),
                  ),
                ),

                const SizedBox(height: 15),

                // Apple Sign In
                Icon(Icons.apple, size: 40, color: Colors.white),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign Up", style: TextStyle(color: Colors.cyanAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}