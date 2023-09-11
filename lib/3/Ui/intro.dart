import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';


class introScrenn1 extends StatefulWidget {
  const introScrenn1({super.key});

  @override
  State<introScrenn1> createState() => _introScrenn1State();
}

class _introScrenn1State extends State<introScrenn1> {

  //  Sliders
  // carousel_slider: ^4.2.1

  List listss  = [
    {"id":1,"colors": Colors.redAccent,"images": 'asses/a.png'},
    {"id":2,"colors": Colors.greenAccent,"images": 'asses/b.png'},
    {"id":3,"colors": Colors.blueAccent,"images": 'asses/a.png'},
    {"id":4,"colors": Colors.redAccent,"images": 'asses/b.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                InkResponse(
                  onTap: (){},
                  child: CarouselSlider(
                      items : listss.map((item) => Image.asset(item['images'],
                          fit: BoxFit.cover,width: 1000
                      )).toList(),
                      carouselController : carouselController,
                      options: CarouselOptions(
                        scrollPhysics: BouncingScrollPhysics(),
                        // autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.5,
                        onPageChanged: (indexs,reason){
                          setState(() {
                            index = indexs;
                          });
                        },
                      )
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listss.asMap().entries.map((entry){
                        print(entry);
                        print(entry.key);
                        return GestureDetector(
                          onTap: (){carouselController.animateToPage(entry.key);},
                          child: Container(
                            width: index == entry.key ? 17:7,
                            height: 7.0,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == entry.key ? Colors.red:Colors.tealAccent
                            ),
                          ),
                        );
                      }).toList(),
                    )
                )
              ],
            ),

            ElevatedButton(onPressed: (){
              setState(() {
                index++;
                listss[index];
              });
            }, child: Text("Next"))
          ],
        ),
      ),
    );
  }

  Widget Frist(){
    return Container(
      color: Colors.redAccent,
    );
  }
}


