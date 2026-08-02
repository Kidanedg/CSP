import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => _loading = false);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Password reset link has been sent.',
        ),
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              const SizedBox(height: 30),

              const Icon(
                Icons.lock_reset,
                size: 90,
              ),

              const SizedBox(height: 30),

              TextFormField(
                controller: _emailController,

                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }

                  if (!value.contains("@")) {
                    return "Invalid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: _loading
                      ? null
                      : _resetPassword,

                  child: _loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Send Reset Link",
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
