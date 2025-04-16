import 'dart:io';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_campus_view/pages/video_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({super.key, required this.collegeType});
  final CollegeType collegeType;

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

  bool isHovering = false;
  bool isHomeHovering = false;
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
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.125,
                right: MediaQuery.of(context).size.width * 0.125,
                bottom: MediaQuery.of(context).size.height * 0.15,
              ),
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
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.885),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25, // Row 전체 너비 제한
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬로 변경
                    children: [
                      SizedBox(
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
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02), // 작은 간격 추가
                      InkWell(
                        onHover: (value) => setState(() => isHomeHovering = value),
                        onTap: () {
                          // 홈 화면으로 돌아가기 (모든 스택 제거)
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', // 홈 화면 라우트
                            (route) => false, // 모든 이전 화면 제거
                          );
                        },
                        child: Image.asset(
                          isHomeHovering ? 'assets/Home_hover.png' : 'assets/Home_idle.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
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
                    overleafColor: Colors.white,
                    animationTransitionPoint: 0.5,
                    transitionDuration: const Duration(milliseconds: 1000),
                    reverseTransitionDuration: const Duration(milliseconds: 800),
                    builder: (context) => VideoViewer(videoPath: videoPath),
                  ),
                );
              } else {
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
              child: videoPath.isNotEmpty
                  ? FutureBuilder<String?>(
                      future: _generateThumbnail(videoPath),
                      builder: (context, snapshot) {
                        // 디버깅 정보 출력
                        print('썸네일 상태: ${snapshot.connectionState}');
                        if (snapshot.hasError) {
                          print('썸네일 에러: ${snapshot.error}');
                        }
                        if (snapshot.hasData) {
                          print('썸네일 경로: ${snapshot.data}');
                          // 파일 존재 확인
                          final file = File(snapshot.data!);
                          final exists = file.existsSync();
                          print('썸네일 파일 존재: $exists');
                        }

                        return Stack(
                          children: [
                            // 썸네일 배경
                            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && File(snapshot.data!).existsSync())
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(snapshot.data!),
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('이미지 로드 에러: $error');
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Icon(
                                          Icons.error,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                            // 썸네일 로드 실패 시 대체 이미지
                            if (snapshot.connectionState == ConnectionState.done && (!snapshot.hasData || !File(snapshot.data!).existsSync()))
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),

                            // 반투명 오버레이
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isHovered ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            // 비디오 제목
                            Center(
                              child: Text(
                                fileName,
                                style: TextStyle(
                                  fontSize: width * 0.1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ROKAF Sans',
                                  color: isHovered ? const Color.fromARGB(255, 155, 32, 37) : Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(2, 0),
                                      color: isHovered ? Colors.white : Colors.black,
                                      blurRadius: 2,
                                    ),
                                    // ... 기존 shadow 효과들 ...
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            // 로딩 표시
                            if (snapshot.connectionState != ConnectionState.done)
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        fileName,
                        style: TextStyle(
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ROKAF Sans',
                          color: isHovered ? const Color.fromARGB(255, 155, 32, 37) : Colors.white,
                          // ... 기존 shadow 효과들 ...
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

  // 썸네일 생성 함수
  Future<String?> _generateThumbnail(String videoPath) async {
    final outputPath = '${(await getTemporaryDirectory()).path}/thumbnail_${DateTime.now().millisecondsSinceEpoch}.jpg';

    // FFmpeg 명령어로 썸네일 추출
    final session = await FFmpegKit.execute('-i "$videoPath" -ss 00:00:01 -vframes 1 -q:v 2 "$outputPath"');

    final returnCode = await session.getReturnCode();
    if (ReturnCode.isSuccess(returnCode)) {
      return outputPath;
    } else {
      print("썸네일 생성 실패: ${await session.getOutput()}");
      return null;
    }
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
