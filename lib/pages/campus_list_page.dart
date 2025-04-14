import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/college%20_menu.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CampusListPage extends StatefulWidget {
  const CampusListPage({super.key});

  @override
  State<CampusListPage> createState() => _CampusListPageState();
}

class _CampusListPageState extends State<CampusListPage> {
  final double animationTransitionPoint = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.jpg'),
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.67),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.59,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3열
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.035,
                      mainAxisSpacing: MediaQuery.of(context).size.height * 0.038,
                      childAspectRatio: 3.8,
                    ),
                    itemCount: 6, // 총 6개 버튼
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: () {
                          // 버튼 클릭 시 CollegeMenu로 이동
                          Navigator.of(context).push(
                            TurnPageRoute(
                              overleafColor: Colors.white, // 페이지 뒷면 색상
                              animationTransitionPoint: animationTransitionPoint,
                              transitionDuration: const Duration(milliseconds: 800),
                              reverseTransitionDuration: const Duration(milliseconds: 500),
                              builder: (context) => const CollegeMenu(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.hovered)) {
                              return const Color.fromARGB(255, 154, 33, 38);
                            }
                            return Colors.white.withOpacity(0.7);
                          }),
                          shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: states.contains(WidgetState.hovered) ? const Color.fromARGB(255, 154, 33, 38) : const Color.fromARGB(255, 10, 72, 138),
                                width: MediaQuery.of(context).size.width * 0.003,
                              ),
                            );
                          }),
                          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.white;
                            }
                            return const Color.fromARGB(255, 10, 72, 138);
                          }),
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                          minimumSize: WidgetStateProperty.all(Size.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Center(
                          child: Text(
                            _getUnivName(index),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.width * 0.022,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
