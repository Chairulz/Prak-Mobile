
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Validasi form
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String nickname = _nicknameController.text;
      String password = _passwordController.text;

      // Autentikasi sederhana
      if (username == "admin" && password == "12345") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Berhasil!")),
        );
        // Navigasi ke Home Page setelah delay singkat
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                username: username,
                nickname: nickname,
              ),
            ),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username atau Password salah!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page", 
        style: TextStyle(
          color: Colors.white,
          )
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 96, 79, 147),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextField(
                controller: _nicknameController,
                decoration: const InputDecoration(
                  labelText: "Nama Panggilan (opsional)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 96, 79, 147),
                  ),
                  onPressed: _login,
                  child: const Text("Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
