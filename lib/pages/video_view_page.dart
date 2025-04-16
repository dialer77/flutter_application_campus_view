import 'dart:io';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/pages/video_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:turn_page_transition/turn_page_transition.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({
    super.key,
    required this.collegeType,
    required this.departmentType,
  });
  final CollegeType collegeType;
  final DepartmentType departmentType;

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
    final videoDir = path.join(executableDir, 'Data', widget.collegeType.displayName, widget.departmentType.displayName);

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
      }
    } catch (e) {}

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
                  top: MediaQuery.of(context).size.height * 0.16,
                  left: MediaQuery.of(context).size.width * 0.135,
                  right: MediaQuery.of(context).size.width * 0.135,
                  bottom: MediaQuery.of(context).size.height * 0.14,
                ),
                child: _buildVideoGrid(_videoFiles.length)),
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
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01), // 작은 간격 추가
                      InkWell(
                        onHover: (value) => setState(() => isHomeHovering = value),
                        onTap: () {
                          // 첫 번째 화면으로 돌아가기
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: Image.asset(
                          isHomeHovering ? 'assets/button_icons/Home_hover.png' : 'assets/button_icons/Home_idle.png',
                          width: MediaQuery.of(context).size.width * 0.045, // 고정 너비 (픽셀)
                          height: MediaQuery.of(context).size.height * 0.045, // 고정 높이 (픽셀)
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

  Widget _buildVideoGrid(int count) {
    const int maxColCount = 5;
    int rowCount = 0;
    int colCount = 0;
    for (int i = maxColCount; i > 0; i--) {
      if (count % i == 0) {
        colCount = i;
        rowCount = count ~/ i;
        break;
      }
    }

    if (count == 7) {
      colCount = 4;
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...(() {
            List<Widget> widgets = [];
            for (int i = 0; i < 2; i++) {
              widgets.add(Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...(() {
                    List<Widget> widgets = [];
                    for (int j = 0; j < colCount - i; j++) {
                      widgets.add(_buildVideoCard(i * colCount + j, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16));
                    }

                    return widgets;
                  }()),
                ],
              ));
            }
            return widgets;
          }()),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < rowCount; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...(() {
                List<Widget> widgets = [];
                for (int j = 0; j < colCount; j++) {
                  widgets.add(_buildVideoCard(i * colCount + j, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16));
                }

                return widgets;
              }()),
            ],
          ),
      ],
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
                                      blurRadius: 1,
                                    ),
                                    Shadow(
                                      offset: const Offset(0, 2),
                                      color: isHovered ? Colors.white : Colors.black,
                                      blurRadius: 1,
                                    ),
                                    Shadow(
                                      offset: const Offset(-2, 0),
                                      color: isHovered ? Colors.white : Colors.black,
                                      blurRadius: 1,
                                    ),
                                    Shadow(
                                      offset: const Offset(0, -2),
                                      color: isHovered ? Colors.white : Colors.black,
                                      blurRadius: 1,
                                    ),
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
}
