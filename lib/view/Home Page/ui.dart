import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


import '../config/PageView MOdel.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  getPages (){
    return [
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://png.pngtree.com/png-clipart/20200701/original/pngtree-business-man-character-introduction-png-image_5422894.jpg", height: 175.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.green,
        ),
      ),
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://example.com/image.png", height: 175.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.blue,
        ),
      ),
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://example.com/image.png", height: 175.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.blue,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Introduction Screen"),
      ),

      body: IntroductionScreen(
        pages: getPages(),
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
          // On Done button pressed
        },
        onSkip: () {
          // On Skip button pressed
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
        ),
      ),
 
    );
  }
}
