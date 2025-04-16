import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/campus_list_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 애니메이션 전환 지점 값 설정 (0부터 1 사이의 값)
  final double animationTransitionPoint = 0.5;
  // hover 상태를 추적하는 변수 추가
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/main_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.885),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHovering = true),
                    onExit: (_) => setState(() => isHovering = false),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          TurnPageRoute(
                            overleafColor: Colors.white, // 페이지 뒷면 색상
                            animationTransitionPoint: animationTransitionPoint,
                            transitionDuration: const Duration(milliseconds: 1000),
                            reverseTransitionDuration: const Duration(milliseconds: 800),
                            builder: (context) => const CampusListPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        isHovering
                            ? 'assets/button_icons/button_next_hover.png' // hover 시 이미지
                            : 'assets/button_icons/button_next.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
