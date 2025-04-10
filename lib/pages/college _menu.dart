import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/video_view_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CollegeMenu extends StatefulWidget {
  const CollegeMenu({super.key});

  @override
  State<CollegeMenu> createState() => _CollegeMenuState();
}

class _CollegeMenuState extends State<CollegeMenu> {
  final homeHoverNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.025,
          left: MediaQuery.of(context).size.width * 0.013,
          right: MediaQuery.of(context).size.width * 0.013,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.0238,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.07,
                    child: Image.asset(
                      'assets/univ_icon_1.png',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                    ),
                    child: Text(
                      '경영대학',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        color: const Color.fromARGB(255, 186, 93, 43),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ROKAF Sans',
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.082,
                    child: Image.asset(
                      'assets/icanweek2.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageButton('assets/1-1.jpg', '경영학부'),
                _buildImageButton('assets/1-2.jpg', '글로벌통상학과'),
                _buildImageButton('assets/1-3.jpg', '디지털금융경영학과'),
                _buildImageButton('assets/1-4.jpg', '디지털기술경영학과'),
              ],
            ),
            const Spacer(),
            Center(
              child: ValueListenableBuilder<bool>(
                  valueListenable: homeHoverNotifier,
                  builder: (context, isHovered, _) {
                    return MouseRegion(
                      onEnter: (_) => homeHoverNotifier.value = true,
                      onExit: (_) => homeHoverNotifier.value = false,
                      child: InkWell(
                        onTap: () {
                          // 홈 버튼 클릭 시 동작 (예: 홈 화면으로 이동)
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                          child: Image.asset(
                            isHovered ? 'assets/Home_hover.png' : 'assets/Home_idle.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageButton(String imagePath, String label) {
    // 호버 상태를 추적하기 위한 변수
    final hoverNotifier = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHovered, _) {
        return MouseRegion(
          onEnter: (_) => hoverNotifier.value = true,
          onExit: (_) => hoverNotifier.value = false,
          child: InkWell(
            onTap: () {
              // 경영학부만 VideoViewPage로 이동
              if (label == '경영학부') {
                Navigator.of(context).push(
                  TurnPageRoute(
                    overleafColor: Colors.white,
                    animationTransitionPoint: 0.5,
                    transitionDuration: const Duration(milliseconds: 800),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    builder: (context) => const VideoViewPage(),
                  ),
                );
              } else {
                // 다른 학부는 준비 중 메시지 표시
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        '알림',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 84, 150),
                          fontFamily: 'ROKAF Sans',
                        ),
                      ),
                      content: const Text(
                        '준비 중입니다. 현재는 경영학부만 이용 가능합니다.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 42, 84, 150),
                          fontFamily: 'ROKAF Sans',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            '확인',
                            style: TextStyle(
                              color: Color.fromARGB(255, 155, 32, 39),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ROKAF Sans',
                            ),
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                );
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.216,
              height: MediaQuery.of(context).size.height * 0.52,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: isHovered ? 0.9 : 1, // 호버 시 더 흐리게 (안개 낀 느낌)
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        color: isHovered ? Colors.white.withOpacity(0.7) : null,
                        colorBlendMode: isHovered ? BlendMode.modulate : null,
                      ),
                    ),
                    Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          color: isHovered
                              ? const Color.fromARGB(255, 155, 32, 39) // 호버 시 빨간색
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.023,
                          fontFamily: 'ROKAF Sans',
                          shadows: [
                            // 텍스트 테두리 효과
                            Shadow(
                              offset: const Offset(1, 1),
                              color: isHovered ? Colors.white : Colors.black,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: const Offset(-1, 1),
                              color: isHovered ? Colors.white : Colors.black,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: const Offset(1, -1),
                              color: isHovered ? Colors.white : Colors.black,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: const Offset(-1, -1),
                              color: isHovered ? Colors.white : Colors.black,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
