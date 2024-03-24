import 'package:flutter/material.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';

class PersionPage extends StatelessWidget {
  const PersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:backgrondColor,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ),
      body: const Center(
        child: Text('Login/signUp',
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.pink)),
      ),
    );
  }
}
