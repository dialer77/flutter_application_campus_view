import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/video_view_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CollegeMenu extends StatefulWidget {
  const CollegeMenu({super.key});

  @override
  State<CollegeMenu> createState() => _CollegeMenuState();
}

class _CollegeMenuState extends State<CollegeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int colIndex = 0; colIndex < 2; colIndex++)
              Expanded(
                child: Row(
                  children: List.generate(3, (index) => _buildGridItem(index + colIndex * 3)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getButtonImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/button_business.png';
      case 1:
        return 'assets/button_engineering.png';
      case 2:
        return 'assets/button_health_science.png';
      case 3:
        return 'assets/button_art_physical_education.png';
      case 4:
        return 'assets/button_social_science.png';
      case 5:
        return 'assets/button_liberal_studies.png';
    }
    return '';
  }

  Widget _buildGridItem(int index) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/college_button_background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.15,
                  right: constraints.maxWidth * 0.1,
                  top: constraints.maxHeight * 0.1,
                  bottom: constraints.maxHeight * 0.1,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // 버튼 클릭 시 VideoViewPage로 이동
                      Navigator.of(context).push(
                        TurnPageRoute(
                          overleafColor: Colors.white, // 페이지 뒷면 색상
                          animationTransitionPoint: 0.5, // 애니메이션 전환 지점
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(milliseconds: 500),
                          builder: (context) => const VideoViewPage(),
                        ),
                      );
                    },
                    splashColor: Colors.white.withOpacity(0.3), // 터치 효과 색상
                    highlightColor: Colors.white.withOpacity(0.1), // 길게 누를 때 색상
                    child: Image.asset(
                      _getButtonImagePath(index),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
