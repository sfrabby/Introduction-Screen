import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class carouselSlider extends StatefulWidget {
  const carouselSlider({super.key});

  @override
  State<carouselSlider> createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,
      title: Text("Carousel Slider", style: TextStyle(color: Colors.white),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child:  CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
