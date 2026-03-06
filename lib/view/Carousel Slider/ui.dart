import 'package:flutter/material.dart';

class carouselSlider extends StatelessWidget {
  const carouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
      title: Text("Carousel Slider", style: TextStyle(color: Colors.white),),),
    );
  }
}
