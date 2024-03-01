import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_notes/src/routing/app_router.dart';
import 'package:quick_notes/src/services/supabase_client.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }

    final supabase = ref.read(supabaseClientProvider);
    final session = supabase.auth.currentSession;
    if (session != null) {
      context.pushNamed(AppRoutes.home.name);
    } else {
      context.pushNamed(AppRoutes.login.name);
    }
  }
}
