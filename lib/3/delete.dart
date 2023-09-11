import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroPageView(),
    );
  }
}


class IntroPageView extends StatelessWidget {
  final List<Widget> pages = [
    IntroPage("Page 1", "Description 1", Icons.ac_unit),
    IntroPage("Page 2", "Description 2", Icons.access_alarm),
    IntroPage("Page 3", "Description 3", Icons.accessibility),
  ];

  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.8,
          child: PageView(
            controller: page,
            physics: NeverScrollableScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: pages,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pages.asMap().entries.map((entry){
            print("wwwwwwwwwwwwwwwwwwwwww $entry");
            print(entry.key);
            return GestureDetector(
              onTap: (){page.animateToPage(entry.key, duration: Duration(seconds: 1), curve: Curves.bounceIn);},
              child: Container(
                width: pageIndex == entry.key ? 17:7,
                height: 7.0,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: pageIndex == entry.key ? Colors.red:Colors.tealAccent
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.1,
          child: ElevatedButton(onPressed: (){
            page.animateToPage(++pageIndex,
                duration: Duration(milliseconds: 400),
                curve: Curves.linearToEaseOut);
          }, child: Text("Click")),
        )
      ],
    );
  }
}


class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  IntroPage(this.title, this.description, this.icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 100.0),
          SizedBox(height: 20.0),
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

