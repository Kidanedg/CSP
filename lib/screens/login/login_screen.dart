import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                const SizedBox(height: 40),

                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.public,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Welcome to CSP",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Computational Social Platform",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty
                          ? "Enter your email"
                          : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty
                          ? "Enter your password"
                          : null,
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    child: const Text("LOGIN"),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text("Don't have an account?"),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.register,
                        );
                      },
                      child: const Text("Register"),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
