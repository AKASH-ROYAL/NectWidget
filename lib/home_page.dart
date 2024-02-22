import 'package:flutter/material.dart';
import 'nectuikit/nect_switch/nect_toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NECT_WIDGETS"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Nect_toggle_switch(value: true, onChanged: (e) {}),
          ],
        ),
      ),
    );
  }
}
