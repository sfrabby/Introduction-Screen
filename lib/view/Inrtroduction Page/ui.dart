import 'package:flutter/material.dart';
import 'package:intorduction_screen/view/Home%20Page/ui.dart';
import 'package:introduction_screen/introduction_screen.dart';


import '../config/PageView MOdel.dart';

class IntroductionPage extends StatelessWidget {
   IntroductionPage({super.key});

  getPages (){
    return [
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://i.pinimg.com/474x/5e/79/d9/5e79d99c2e67bbee4ce4598940cc960d.jpg", height: 200.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.green,
        ),
      ),
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://cdn.pixabay.com/photo/2023/06/28/08/13/public-speaking-8093767_1280.png", height: 200.0),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.blue,
        ),
      ),
      PageViewModel(
        title: "Title of blue page",
        body: "Welcome to the app! This is a description on a page with a blue background.",
        image: Center(
          child: Image.network("https://i.pinimg.com/736x/3e/aa/30/3eaa30f9297b0ded90ea098519283e44.jpg", height: 200.0),
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

      body: IntroductionScreen(
        pages: getPages(),
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
