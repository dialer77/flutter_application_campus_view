import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/college%20_menu.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 애니메이션 전환 지점 값 설정 (0부터 1 사이의 값)
  final double animationTransitionPoint = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              // MaterialPageRoute 대신 TurnPageRoute 사용
              TurnPageRoute(
                overleafColor: Colors.white, // 페이지 뒷면 색상
                animationTransitionPoint: animationTransitionPoint,
                transitionDuration: const Duration(milliseconds: 800),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                builder: (context) => const CollegeMenu(),
              ),
            );
          },
        ),
      ),
    );
  }
}
