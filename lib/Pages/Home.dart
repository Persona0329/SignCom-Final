import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase authentication package or any other authentication package you're using
import 'package:signcom/Pages/Account_details.dart';
import 'package:signcom/Pages/Lesson_details.dart';
import 'package:signcom/Pages/Task_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  var currentIndex = 0;
  late User _currentUser; // Declare currentUser variable

  @override
  void initState() {
    super.initState();
    // Get current user when the widget initializes
    _currentUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo2.png',
          height: 40,
          width: 40,
          fit: BoxFit.contain,
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeDetailPage(),
          LessonsDetailPage(),
          TaskDetailPage(),
          AccountDetailPage(currentUser: _currentUser), // Pass currentUser here
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * 0.05),
        height: displayWidth * 0.2,
        decoration: BoxDecoration(
          color: Color.fromRGBO(48, 46, 48, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarButton(
              icon: Icons.home_rounded,
              index: 0,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
              },
            ),
            BottomBarButton(
              icon: Icons.menu_book_rounded,
              index: 1,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
              },
            ),
            BottomBarButton(
              icon: Icons.assignment_rounded,
              index: 2,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
              },
            ),
            BottomBarButton(
              icon: Icons.person_rounded,
              index: 3,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  void handleNavigation(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}

class BottomBarButton extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function onTap;

  const BottomBarButton({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double buttonWidth = displayWidth * 0.18;

    if (currentIndex == index) {
      buttonWidth = displayWidth * 0.32;
    }

    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: buttonWidth,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: currentIndex == index ? displayWidth * 0.12 : 0,
              width: currentIndex == index ? displayWidth * 0.32 : 0,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Color.fromRGBO(0, 255, 163, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: buttonWidth,
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: displayWidth * 0.076,
              color: currentIndex == index ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom shape for AppBar
class AppBarShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(rect)
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.right, rect.bottom);
  }
}

class HomeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Text('This is the Home Detail Page'),
      ),
    );
  }
}
