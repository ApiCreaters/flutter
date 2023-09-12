import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    update(['fghjkl']);
    selectedIndex.value = index;
  }
}

class HomeScreen98 extends StatefulWidget {
  const HomeScreen98({super.key});

  @override
  State<HomeScreen98> createState() => _HomeScreen98State();
}

class _HomeScreen98State extends State<HomeScreen98> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar and Click Color Change with GetX Example'),
      ),
      body: Center(
        child: ClickableItem(0),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}

class BottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      id: 'fghjkl',
            init: BottomNavBarController(),
            builder: (bottomNavController) {
              return BottomNavigationBar(
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: (index) => bottomNavController.changeTabIndex(index),
        items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
        ],
      );
            }
          );
  }
}

class ClickableItem extends GetView<BottomNavBarController> {
  final int index;
  ClickableItem(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.changeTabIndex(index),
      child: Container(
        width: 200,
        height: 200,
        color: controller.selectedIndex.value == index ? Colors.blue : Colors.red,
        child: Center(
          child: Text(
            'Item $index',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

