import 'package:flutter/material.dart';
import 'category.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({super.key});

  @override
  WelcomeBackPageState createState() => WelcomeBackPageState();
}

class WelcomeBackPageState extends State<WelcomeBackPage> {
  @override
  void initState() {
    super.initState();

    // Auto-redirect after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   CategoryDetailPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meatoes'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.orange, // Use theme's primary color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text with message
            Text(
              'Enjoy Your Cooking!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ) ?? const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
