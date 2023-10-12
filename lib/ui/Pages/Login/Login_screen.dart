// ignore_for_file: file_names, deprecated_member_use

import 'package:abexastore/ui/Pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 2, 64),
      body: CardLogin(),
    );
  }
}

class CardLogin extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CardLogin({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _CardLoginState createState() => _CardLoginState();
}

class _CardLoginState extends State<CardLogin> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
  final username = _usernameController.text;
  final password = _passwordController.text;

  if (username == "admin" && password == "123") {
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Credenciales incorrectas'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/cars.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _usernameController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 10, 53, 88),
                ),
                onPressed: () {
                  _login(context); 
                },
                child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Olvidé mi contraseña'),
                  ),
                  TextButton(
                    onPressed: () => context.go('/register'),
                    child: const Text('Quiero registrarme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
