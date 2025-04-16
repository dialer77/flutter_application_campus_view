import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:flutter_application_campus_view/pages/college%20_menu.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CampusListPage extends StatefulWidget {
  const CampusListPage({super.key});

  @override
  State<CampusListPage> createState() => _CampusListPageState();
}

class _CampusListPageState extends State<CampusListPage> {
  final double animationTransitionPoint = 0.5;

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/campus_list_page.png'),
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.185),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.64,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3열
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.015,
                      mainAxisSpacing: MediaQuery.of(context).size.height * 0.026,
                      childAspectRatio: 1.25,
                    ),
                    itemCount: 6, // 총 6개 버튼
                    itemBuilder: (context, index) {
                      return _buildImageButton(index);
                    },
                  ),
                ),
              ),
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

  String _getButtonImage(int index) {
    return 'assets/button_icons/campus${index + 1}.jpg';
  }

  String _getUnivName(int index) {
    switch (index) {
      case 0:
        return '경영대학';
      case 1:
        return '공과대학';
      case 2:
        return '생명보건대학';
      case 3:
        return '예체능대학';
      case 4:
        return '인문사회대학';
      case 5:
        return '자유전공대학';
      default:
        return '';
    }
  }

  Widget _buildImageButton(int index) {
    bool isHovered = false;

    return StatefulBuilder(builder: (context, setState) {
      return Opacity(
        opacity: isHovered ? 1.0 : 0.7,
        child: InkWell(
          onHover: (hovering) {
            setState(() {
              isHovered = hovering;
            });
          },
          onTap: () {
            Navigator.of(context).push(
              TurnPageRoute(
                overleafColor: Colors.white, // 페이지 뒷면 색상
                animationTransitionPoint: animationTransitionPoint,
                transitionDuration: const Duration(milliseconds: 1000),
                reverseTransitionDuration: const Duration(milliseconds: 800),
                builder: (context) => CollegeMenu(collegeType: CollegeType.values[index]),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Stack(
              children: [
                Image.asset(
                  _getButtonImage(index),
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      // 테두리 효과를 위한 그림자 텍스트들
                      Text(
                        _getUnivName(index),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * 0.022,
                          color: Colors.white, // 테두리 색상
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // 각 방향의 오프셋을 적용한 텍스트들
                      ...[-1, 1].expand((dx) => [-1, 1].map((dy) => Positioned(
                            left: dx.toDouble(),
                            top: dy.toDouble(),
                            child: Text(
                              _getUnivName(index),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                color: Colors.white, // 테두리 색상
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                      // 원래 텍스트
                      Text(
                        _getUnivName(index),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.width * 0.022,
                          color: isHovered ? const Color.fromARGB(255, 156, 33, 41) : const Color.fromARGB(255, 14, 72, 136), // 원래 텍스트 색상
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
