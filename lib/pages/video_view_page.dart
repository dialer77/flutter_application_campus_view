import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_campus_view/pages/video_viewer.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({super.key});

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  final backHoverNotifier = ValueNotifier<bool>(false);
  final homeHoverNotifier = ValueNotifier<bool>(false);

  // 클래스 상단에 정적 리스트 추가
  static List<String> _videoFiles = [];

  // initState 추가 (StatefulWidget으로 변경 필요)
  @override
  void initState() {
    super.initState();
    _loadVideoFiles();
  }

  // 비디오 파일 목록을 로드하는 메서드
  void _loadVideoFiles() {
    // 실행 파일의 디렉토리 경로 가져오기
    final executableDir = path.dirname(Platform.resolvedExecutable);

    // 비디오 폴더 경로
    final videoDir = path.join(executableDir, 'Data', '#경영대학', '경영학부(20팀)');

    try {
      // 디렉토리 객체 생성
      final directory = Directory(videoDir);

      // 디렉토리 존재 여부 확인
      if (directory.existsSync()) {
        // 디렉토리 내 모든 파일 목록 가져오기
        _videoFiles =
            directory.listSync().where((entity) => entity is File && (entity.path.toLowerCase().endsWith('.mp4') || entity.path.toLowerCase().endsWith('.mov'))).map((entity) => entity.path).toList();

        // 파일명으로 정렬 (1조.mp4, 2조.mp4, ... 순서로)
        _videoFiles.sort((a, b) {
          // 파일명 추출
          final aFileName = path.basename(a);
          final bFileName = path.basename(b);

          // "조" 숫자 추출 시도
          final aMatch = RegExp(r'(\d+)조').firstMatch(aFileName);
          final bMatch = RegExp(r'(\d+)조').firstMatch(bFileName);

          if (aMatch != null && bMatch != null) {
            // 숫자로 변환하여 비교
            return int.parse(aMatch.group(1)!).compareTo(int.parse(bMatch.group(1)!));
          }

          // 정규식 매치 실패시 파일명으로 비교
          return aFileName.compareTo(bFileName);
        });

        print('로드된 비디오 파일: ${_videoFiles.length}개');
        for (var file in _videoFiles) {
          print('- ${path.basename(file)}');
        }
      } else {
        print('비디오 디렉토리가 존재하지 않습니다: $videoDir');
      }
    } catch (e) {
      print('비디오 파일 로드 중 오류 발생: $e');
    }

    // 비디오 파일이 없는 경우 기본 테스트 파일 추가
    if (_videoFiles.isEmpty) {
      final testVideo = path.join(executableDir, 'Data', 'test.mov');
      if (File(testVideo).existsSync()) {
        _videoFiles.add(testVideo);
      }
    }

    // 상태 갱신
    if (mounted) setState(() {});
  }

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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
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
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.height * 0.69,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int j = 0; j < 5; j++) _buildVideoCard(i * 5 + j, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16),
                        ],
                      ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.4,
                  right: MediaQuery.of(context).size.width * 0.4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: backHoverNotifier,
                      builder: (context, isHovered, _) {
                        return MouseRegion(
                          onEnter: (_) => backHoverNotifier.value = true,
                          onExit: (_) => backHoverNotifier.value = false,
                          child: InkWell(
                            onTap: () {
                              // 홈 버튼 클릭 시 동작 (예: 홈 화면으로 이동)
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                              child: Icon(
                                Icons.chevron_left,
                                color: isHovered ? const Color.fromARGB(255, 155, 33, 38) : Colors.black,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: homeHoverNotifier,
                      builder: (context, isHovered, _) {
                        return MouseRegion(
                          onEnter: (_) => homeHoverNotifier.value = true,
                          onExit: (_) => homeHoverNotifier.value = false,
                          child: InkWell(
                            onTap: () {
                              // 홈 버튼 클릭 시 메인 페이지로 이동 (모든 스택 제거)
                              Navigator.of(context).popUntil((route) => route.isFirst);
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
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard(int index, double width, double height) {
    // 파일명 추출 로직
    String fileName = '';
    String videoPath = '';

    if (index < _videoFiles.length && _videoFiles.isNotEmpty) {
      // 비디오 경로 저장
      videoPath = _videoFiles[index];

      // 전체 경로에서 파일명만 추출
      String fullFileName = path.basename(videoPath);

      // 확장자 제거
      fileName = fullFileName.substring(0, fullFileName.lastIndexOf('.'));
    } else {
      fileName = 'Video $index';
      videoPath = '';
    }

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
              // 비디오 경로가 있을 때만 비디오 재생 화면으로 이동
              if (videoPath.isNotEmpty) {
                print('비디오 재생: $videoPath');
                Navigator.of(context).push(
                  TurnPageRoute(
                    overleafColor: Colors.white, // 넘기는 페이지 색상
                    animationTransitionPoint: 0.5, // 애니메이션 전환 지점
                    transitionDuration: const Duration(milliseconds: 800), // 전환 지속 시간
                    reverseTransitionDuration: const Duration(milliseconds: 500), // 역방향 전환 지속 시간
                    builder: (context) => VideoViewer(videoPath: videoPath),
                  ),
                );
              } else {
                // 비디오 경로가 없을 경우 오류 메시지 표시
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('비디오 파일을 찾을 수 없습니다.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: isHovered ? const Color.fromARGB(255, 163, 163, 163) : const Color.fromARGB(255, 190, 190, 190).withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  fileName, // 추출된 파일명 사용
                  style: TextStyle(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ROKAF Sans',
                    color: isHovered
                        ? const Color.fromARGB(255, 155, 32, 37) // 호버 시 빨간색
                        : Colors.white,
                    shadows: [
                      // 텍스트 테두리 효과를 위한 그림자들
                      Shadow(
                        offset: const Offset(2, 0),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(-2, 0),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(0, 2),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(0, -2),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      // 대각선 방향도 추가하여 더 완전한 테두리 효과 생성
                      Shadow(
                        offset: const Offset(1.5, 1.5),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(-1.5, 1.5),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(1.5, -1.5),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: const Offset(-1.5, -1.5),
                        color: isHovered ? Colors.white : Colors.black,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getVideoPath(int index) {
    if (index >= 0 && index < _videoFiles.length) {
      return _videoFiles[index];
    }

    // 인덱스가 범위를 벗어나거나 파일이 없는 경우 기본 테스트 비디오 반환
    final executableDir = path.dirname(Platform.resolvedExecutable);
    final testVideo = path.join(executableDir, 'Data', 'test.mov');

    print('기본 비디오 반환: $testVideo (인덱스: $index, 총 파일 수: ${_videoFiles.length})');
    return testVideo;
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
