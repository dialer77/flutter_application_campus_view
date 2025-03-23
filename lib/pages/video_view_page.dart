import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:flutter_application_campus_view/pages/video_viewer.dart'; // VideoViewer 페이지 import

class VideoViewPage extends StatelessWidget {
  const VideoViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/video_view_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.15,
              top: MediaQuery.of(context).size.height * 0.225,
              bottom: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                for (int colIndex = 0; colIndex < 4; colIndex++)
                  Expanded(
                    child: Row(
                      children: List.generate(3, (index) => _buildGridItem(index + colIndex * 3)),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      // 이전 화면으로 돌아가기
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color.fromARGB(255, 42, 84, 150),
                          width: 5,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.01,
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_rounded,
                              color: const Color.fromARGB(255, 235, 208, 101),
                              size: MediaQuery.of(context).size.height * 0.065,
                            ),
                            Text(
                              '학과 선택',
                              style: GoogleFonts.notoSans(
                                fontSize: MediaQuery.of(context).size.width * 0.02,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 42, 84, 150),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      // 미구현 알림 팝업 표시
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              '알림',
                              style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 42, 84, 150),
                              ),
                            ),
                            content: Text(
                              '아직 미구현 항목입니다.',
                              style: GoogleFonts.notoSans(
                                color: const Color.fromARGB(255, 42, 84, 150),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  '확인',
                                  style: GoogleFonts.notoSans(
                                    color: const Color.fromARGB(255, 235, 208, 101),
                                    fontWeight: FontWeight.bold,
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
                    },
                    child: Ink(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: Image.asset(
                          'assets/next_department.png',
                          height: MediaQuery.of(context).size.height * 0.065,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getVideoPath(int index) {
    // 실행 파일의 디렉토리 경로 가져오기
    String executableDir = path.dirname(Platform.resolvedExecutable);

    // 비디오 상대 경로
    String relativePath;
    switch (index) {
      case 0:
        relativePath = 'Data\\1.경영대학\\1.구구12단_[영상] 경영학부_김민경.mp4';
        break;
      case 1:
        relativePath = 'Data\\1.경영대학\\2.이해하기 참 십조 [영상] 경영학부_김민서.mov';
        break;
      default:
        relativePath = 'Data\\test.mov';
    }

    // 전체 경로 조합
    String fullPath = path.join(executableDir, relativePath);
    print('Loading video from: $fullPath'); // 디버깅용 로그

    // 파일 존재 여부 체크
    if (!File(fullPath).existsSync()) {
      print('Video file not found: $fullPath');
      return path.join(executableDir, 'Data\\test.mov');
    }

    return fullPath;
  }

  Widget _buildGridItem(int index) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.only(
            left: constraints.maxWidth * 0.05,
            right: constraints.maxWidth * 0.1,
            top: constraints.maxHeight * 0.1,
            bottom: constraints.maxHeight * 0.1,
          ),
          child: Material(
            elevation: 10, // 그림자 효과
            shadowColor: Colors.black.withOpacity(0.4),
            color: const Color.fromARGB(255, 198, 211, 237),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  TurnPageRoute(
                    overleafColor: Colors.white, // 페이지 뒷면 색상
                    animationTransitionPoint: 0.5, // 애니메이션 전환 지점
                    transitionDuration: const Duration(milliseconds: 800),
                    reverseTransitionDuration: const Duration(milliseconds: 500),
                    builder: (context) => VideoViewer(videoPath: _getVideoPath(index)), // 인덱스 전달
                  ),
                );
              },
              borderRadius: BorderRadius.circular(180),
              splashColor: Colors.blue.withOpacity(0.5), // 더 눈에 띄는 색상
              highlightColor: Colors.lightBlue.withOpacity(0.3), // 더 눈에 띄는 색상
              child: Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.15,
                  right: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.05,
                  bottom: constraints.maxHeight * 0.05,
                ),
                child: _buildVideoInfoText(index, constraints.maxWidth * 0.065),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoInfoText(int index, double textSize) {
    String teamName = '';
    switch (index) {
      case 0:
        teamName = '구구12단';
        break;
      case 1:
        teamName = "이해하기 참 십조";
        break;
      case 2:
        teamName = "2조";
        break;
      case 3:
        teamName = "피할 수 없는 13";
        break;
      case 4:
        teamName = "아이캔위크 경영학부 18조";
        break;
      case 5:
        teamName = "88조";
        break;
      case 6:
        teamName = "11조";
        break;
      case 7:
        teamName = "15조";
        break;
      case 8:
        teamName = "아이캔위크 7조";
        break;
      case 9:
        teamName = "16조 귀엽조";
        break;
      case 10:
        teamName = "최강경영 4조";
        break;
      case 11:
        teamName = "3조 일등시켜조";
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              '학과 : ',
              style: GoogleFonts.notoSans(
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 42, 84, 150),
              ),
            ),
            Text(
              '경영학부',
              style: GoogleFonts.notoSans(
                fontSize: textSize,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 42, 84, 150),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '팀명 : ',
              style: GoogleFonts.notoSans(
                fontSize: textSize,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 42, 84, 150),
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  teamName,
                  style: GoogleFonts.notoSans(
                    fontSize: textSize,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(255, 42, 84, 150),
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
