import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../routes/app_routes.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends State<EmailVerificationScreen> {
  bool _checking = false;

  Future<void> _refreshStatus() async {
    setState(() => _checking = true);

    final auth = context.read<AuthProvider>();
    await auth.refreshUser();

    if (!mounted) return;

    setState(() => _checking = false);

    if (auth.user?.isEmailVerified ?? false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Your email is not verified yet.',
          ),
        ),
      );
    }
  }

  Future<void> _resendEmail() async {
    await context.read<AuthProvider>().sendEmailVerification();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Verification email sent successfully.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = context.watch<AuthProvider>().user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mark_email_read_outlined,
                size: 90,
              ),
              const SizedBox(height: 24),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'A verification email has been sent to:\n$email',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: _checking ? null : _refreshStatus,
                child: _checking
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'I Have Verified My Email',
                      ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _resendEmail,
                child: const Text(
                  'Resend Verification Email',
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  await context.read<AuthProvider>().logout();

                  if (!mounted) return;

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
                child: const Text(
                  'Back to Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
