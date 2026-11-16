import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../Providers/AuthProvider.dart';
import 'Category.dart';
import 'Login.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? _restoreError;
  bool _restoring = false;

  @override
  void initState() {
    super.initState();
    unawaited(_restoreSession());
  }

  Future<void> _restoreSession({bool waitForSplash = true}) async {
    if (_restoring) return;
    _restoring = true;
    if (_restoreError != null) setState(() => _restoreError = null);
    try {
      if (waitForSplash)
        await Future<void>.delayed(const Duration(milliseconds: 3500));
      if (!mounted) return;
      final user = await AuthProvider.getUserData();
      if (!mounted) return;
      if (user != null) context.read<AuthProvider>().userModel = user;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(
          builder: (_) => user == null ? Login() : Category(),
        ),
        (_) => false,
      );
    } on Exception {
      if (mounted)
        setState(
          () => _restoreError = 'Unable to restore your session. Please retry.',
        );
    } finally {
      _restoring = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox.shrink(),
            const SizedBox.shrink(),
            Image.asset('assets/images/logo.png', width: 150, height: 150),
            const SizedBox.shrink(),
            const SizedBox.shrink(),
            if (_restoreError == null)
              const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            else
              Column(
                children: [
                  Text(_restoreError!),
                  TextButton(
                    onPressed: () => _restoreSession(waitForSplash: false),
                    child: const Text('Retry'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
