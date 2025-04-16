import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:flutter_application_campus_view/pages/video_view_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CollegeMenu extends StatefulWidget {
  final CollegeType collegeType;
  const CollegeMenu({super.key, required this.collegeType});

  @override
  State<CollegeMenu> createState() => _CollegeMenuState();
}

class _CollegeMenuState extends State<CollegeMenu> {
  final homeHoverNotifier = ValueNotifier<bool>(false);
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/college_menu_${widget.collegeType.name}.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            _buildDepartmentList(widget.collegeType),
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
                        // 이전 페이지로 돌아가기
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        isHovering
                            ? 'assets/button_icons/button_prev_hover.png' // hover 시 이미지
                            : 'assets/button_icons/button_prev.png',
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

  Widget _buildDepartmentList(CollegeType collegeType) {
    switch (collegeType) {
      case CollegeType.business:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.015,
            right: MediaQuery.of(context).size.width * 0.015,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/${BusinessDepartment.businessAdministration.name}.jpg', [BusinessDepartment.businessAdministration.displayName]),
              _buildImageButton('assets/button_icons/${BusinessDepartment.globalCommerce.name}.jpg', [BusinessDepartment.globalCommerce.displayName]),
              _buildImageButton('assets/button_icons/${BusinessDepartment.digitalFinanceManagement.name}.jpg', [BusinessDepartment.digitalFinanceManagement.displayName]),
              _buildImageButton('assets/button_icons/${BusinessDepartment.digitalTechnologyManagement.name}.jpg', [BusinessDepartment.digitalTechnologyManagement.displayName]),
            ],
          ),
        );
      case CollegeType.engineering:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/Engineering1.jpg', ['건축토목공학부', '미래자동차공학과', '안전공학과', '정보통신공학부']),
              _buildImageButton('assets/button_icons/Engineering2.jpg', ['건축학과', '소방방재학과', '전기공학과', '화학공학과']),
              _buildImageButton('assets/button_icons/Engineering3.jpg', ['기계공학과', '시스템제어공학과', '전자재료공학과', '환경공학과']),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildImageButton(String imagePath, List<String> labels) {
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
              if (labels[0] == '경영학부') {
                Navigator.of(context).push(
                  TurnPageRoute(
                    overleafColor: Colors.white,
                    animationTransitionPoint: 0.5,
                    transitionDuration: const Duration(milliseconds: 1000),
                    reverseTransitionDuration: const Duration(milliseconds: 800),
                    builder: (context) => VideoViewPage(collegeType: widget.collegeType),
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
                        '준비 중입니다.',
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
                      opacity: isHovered ? 1 : 0.7, // 호버 시 더 흐리게 (안개 낀 느낌)
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        color: isHovered ? null : Colors.white.withOpacity(0.7),
                        colorBlendMode: isHovered ? null : BlendMode.modulate,
                      ),
                    ),
                    Center(
                      child: Text(
                        labels[0],
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
