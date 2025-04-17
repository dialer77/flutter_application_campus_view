import 'dart:io';
import 'dart:math';
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
  static List<String> _thumbnailFiles = [];

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
    final videoDir = path.join(executableDir, 'Data', 'videos', widget.collegeType.displayName, widget.departmentType.displayName);
    final thumbnailDir = path.join(executableDir, 'Data', 'thumbnails', widget.collegeType.displayName, widget.departmentType.displayName);

    try {
      // 디렉토리 객체 생성
      final directory = Directory(videoDir);
      final thumbnailDirectory = Directory(thumbnailDir);

      // 디렉토리 존재 여부 확인
      if (directory.existsSync()) {
        // 디렉토리 내 모든 파일 목록 가져오기
        _videoFiles =
            directory.listSync().where((entity) => entity is File && (entity.path.toLowerCase().endsWith('.mp4') || entity.path.toLowerCase().endsWith('.mov'))).map((entity) => entity.path).toList();

        _thumbnailFiles = thumbnailDirectory
            .listSync()
            .where((entity) => entity is File && (entity.path.toLowerCase().endsWith('.jpg') || entity.path.toLowerCase().endsWith('.png')))
            .map((entity) => entity.path)
            .toList();

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

        _thumbnailFiles.sort((a, b) {
          final aFileName = path.basename(a);
          final bFileName = path.basename(b);

          // "조" 숫자 추출 시도
          final aMatch = RegExp(r'(\d+)조').firstMatch(aFileName);
          final bMatch = RegExp(r'(\d+)조').firstMatch(bFileName);

          if (aMatch != null && bMatch != null) {
            return int.parse(aMatch.group(1)!).compareTo(int.parse(bMatch.group(1)!));
          }

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

    // 고정 간격 정의
    final horizontalSpacing = MediaQuery.of(context).size.width * 0.02;
    final verticalSpacing = MediaQuery.of(context).size.height * 0.02;

    if (count == 7) {
      colCount = 4;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(() {
            List<Widget> widgets = [];
            for (int i = 0; i < 2; i++) {
              if (i > 0) {
                widgets.add(SizedBox(height: verticalSpacing));
              }
              widgets.add(Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...(() {
                    List<Widget> rowWidgets = [];
                    for (int j = 0; j < colCount - i; j++) {
                      if (j > 0) {
                        rowWidgets.add(SizedBox(width: horizontalSpacing));
                      }
                      rowWidgets.add(_buildVideoCard(i * colCount + j, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16));
                    }
                    return rowWidgets;
                  }()),
                ],
              ));
            }
            return widgets;
          }()),
        ],
      );
    } else if (count == 14) {
      // 5-5-4 배치로 구현
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...(() {
            List<Widget> widgets = [];
            // 각 행의 카드 개수 정의
            List<int> rowCounts = [5, 5, 4];

            int cardIndex = 0;

            // 3개 행 생성 (5-5-4)
            for (int i = 0; i < 3; i++) {
              if (i > 0) {
                widgets.add(SizedBox(height: verticalSpacing));
              }

              widgets.add(Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...(() {
                    List<Widget> rowWidgets = [];
                    for (int j = 0; j < rowCounts[i]; j++) {
                      if (j > 0) {
                        rowWidgets.add(SizedBox(width: horizontalSpacing));
                      }
                      rowWidgets.add(_buildVideoCard(cardIndex++, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16));
                    }
                    return rowWidgets;
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...(() {
          List<Widget> columnWidgets = [];
          for (int i = 0; i < rowCount; i++) {
            if (i > 0) {
              columnWidgets.add(SizedBox(height: verticalSpacing));
            }
            columnWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...(() {
                  List<Widget> rowWidgets = [];
                  for (int j = 0; j < colCount; j++) {
                    if (j > 0) {
                      rowWidgets.add(SizedBox(width: horizontalSpacing));
                    }
                    rowWidgets.add(_buildVideoCard(i * colCount + j, MediaQuery.of(context).size.width * 0.13, MediaQuery.of(context).size.height * 0.16));
                  }
                  return rowWidgets;
                }()),
              ],
            ));
          }
          return columnWidgets;
        }()),
      ],
    );
  }

  Widget _buildVideoCard(int index, double width, double height) {
    // 파일명 추출 로직
    String fileName = '';
    String videoPath = '';
    String? thumbnailPath;

    if (index < _videoFiles.length && _videoFiles.isNotEmpty) {
      // 비디오 경로 저장
      videoPath = _videoFiles[index];

      // 전체 경로에서 파일명만 추출
      String fullFileName = path.basename(videoPath);

      // 확장자 제거
      fileName = fullFileName.substring(0, fullFileName.lastIndexOf('.'));

      // 썸네일 찾기 - 파일명이 동일한 썸네일 검색
      thumbnailPath = _findMatchingThumbnail(fileName);
    } else {
      fileName = 'Video $index';
      videoPath = '';
    }

    // 텍스트 줄바꿈 처리
    String displayText = _processTextForWrapping(fileName, width);

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
                  ? Stack(
                      children: [
                        // 썸네일 배경 - 호버 시 불투명도 변경
                        if (thumbnailPath != null && File(thumbnailPath).existsSync())
                          Positioned.fill(
                            child: Opacity(
                              opacity: isHovered ? 1.0 : 0.5, // 호버 상태에 따라 투명도 조정
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(thumbnailPath),
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
                          ),

                        // 비디오 제목 - 처리된 텍스트 사용
                        Center(
                          child: Text(
                            displayText, // 수동으로 줄바꿈이 처리된 텍스트
                            style: TextStyle(
                              fontSize: width * 0.1,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ROKAF Sans',
                              color: isHovered ? const Color.fromARGB(255, 155, 32, 37) : Colors.white,
                              shadows: [
                                Shadow(
                                  offset: const Offset(1, 0),
                                  color: isHovered ? Colors.white : Colors.black,
                                  blurRadius: 1,
                                ),
                                Shadow(
                                  offset: const Offset(0, 1),
                                  color: isHovered ? Colors.white : Colors.black,
                                  blurRadius: 1,
                                ),
                                Shadow(
                                  offset: const Offset(-1, 0),
                                  color: isHovered ? Colors.white : Colors.black,
                                  blurRadius: 1,
                                ),
                                Shadow(
                                  offset: const Offset(0, 1),
                                  color: isHovered ? Colors.white : Colors.black,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        displayText, // 수동으로 줄바꿈이 처리된 텍스트
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

  // 텍스트 줄바꿈 처리 메서드
  String _processTextForWrapping(String text, double containerWidth) {
    // 단어가 하나만 있거나 텍스트가 짧으면 그대로 반환
    if (!text.contains(' ') || text.length < 10) {
      return text;
    }

    // 폰트 크기 계산 (원래 로직에서 사용하던 폰트 크기)
    double fontSize = containerWidth * 0.1;

    // 평균 글자 너비 계산 (한글은 더 넓은 공간을 차지하므로 적용)
    double avgCharWidth = fontSize * 0.85;

    // 한 줄에 들어갈 수 있는 글자 수 계산 (여유 공간 고려하여 10% 마진 적용)
    int charsPerLine = ((containerWidth * 0.9) / avgCharWidth).floor();

    // 최소 2글자는 보여줄 수 있도록 보정
    if (charsPerLine < 2) charsPerLine = 2;

    print('Container width: $containerWidth, Font size: $fontSize, Chars per line: $charsPerLine');

    // 괄호 내용을 포함한 단어들로 분리 (이때 charsPerLine 전달)
    List<String> segments = _splitTextKeepingParentheses(text, charsPerLine);
    List<String> lines = [];
    String currentLine = '';

    for (String segment in segments) {
      // 현재 줄 + 다음 단어가 한 줄에 들어갈 수 있는지 확인
      if ((currentLine.isEmpty ? 0 : currentLine.length + 1) + segment.length <= charsPerLine) {
        // 현재 줄이 비어있지 않으면 공백 추가
        if (currentLine.isNotEmpty) {
          currentLine += ' ';
        }
        currentLine += segment;
      } else {
        // 현재 줄을 라인 배열에 추가하고 새 줄 시작
        if (currentLine.isNotEmpty) {
          lines.add(currentLine);
        }

        // 세그먼트가 한 줄에 들어갈 수 없을 정도로 길면 별도 처리
        if (segment.length > charsPerLine) {
          // 세그먼트를 더 작은 단위로 분할
          int start = 0;
          while (start < segment.length) {
            int end = start + charsPerLine;
            if (end > segment.length) end = segment.length;

            // 줄 중간에서 자르지 않도록 마지막 공백 위치 찾기
            if (end < segment.length && segment[end] != ' ') {
              int lastSpace = segment.lastIndexOf(' ', end);
              if (lastSpace > start) {
                end = lastSpace;
              }
            }

            lines.add(segment.substring(start, end).trim());
            start = end;
          }
          currentLine = '';
        } else {
          // 새 줄은 현재 세그먼트로 시작
          currentLine = segment;
        }
      }
    }

    // 마지막 줄 추가
    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    // 최대 줄 수 제한 (3줄)
    if (lines.length > 3) {
      lines = lines.sublist(0, 3);
      // 마지막 줄에 말줄임표 추가
      if (lines[2].length > 3) {
        lines[2] = '${lines[2].substring(0, lines[2].length - 3)}...';
      } else {
        lines[2] += '...';
      }
    }

    return lines.join('\n');
  }

  // 텍스트를 소괄호를 유지하면서 분리하는 메서드
  List<String> _splitTextKeepingParentheses(String text, int charsPerLine) {
    List<String> result = [];
    int start = 0;
    bool inParentheses = false;

    for (int i = 0; i < text.length; i++) {
      if (text[i] == '(') {
        inParentheses = true;

        // 괄호 시작 전에 단어가 있었다면 추가
        if (i > start && text.substring(start, i).trim().isNotEmpty) {
          result.add(text.substring(start, i).trim());
        }
        start = i; // 괄호 시작 위치부터 새로운 세그먼트 시작
      } else if (text[i] == ')' && inParentheses) {
        inParentheses = false;
        // 괄호가 끝난 위치까지를 하나의 세그먼트로 고려
        i++; // 닫는 괄호 다음 위치로

        if (i <= text.length) {
          String parenthesisContent = text.substring(start, i).trim();

          // 괄호 내용이 너무 길면 (charsPerLine의 1.5배를 기준으로) 내부 공백으로 분리 고려
          if (parenthesisContent.length > charsPerLine * 1.5) {
            // 괄호 내부 내용 추출 (괄호 제외)
            String innerContent = parenthesisContent.substring(1, parenthesisContent.length - 1);

            // 내부 내용에 공백이 있으면
            if (innerContent.contains(' ')) {
              // 소괄호 열기 추가
              result.add("(");

              // 내부 내용을 공백으로 분리하여 각각 처리
              List<String> innerWords = innerContent.split(' ');
              String currentSegment = "";

              for (String word in innerWords) {
                if (currentSegment.isEmpty) {
                  currentSegment = word;
                } else if ((currentSegment.length + 1 + word.length) <= charsPerLine) {
                  currentSegment += " $word";
                } else {
                  result.add(currentSegment);
                  currentSegment = word;
                }
              }

              // 마지막 세그먼트 추가
              if (currentSegment.isNotEmpty) {
                // 마지막 세그먼트에 닫는 괄호 붙이기
                result.add("$currentSegment)");
              } else {
                // 닫는 괄호 별도 추가
                result.add(")");
              }
            } else {
              // 내부에 공백이 없으면 그대로 추가
              result.add(parenthesisContent);
            }
          } else {
            // 길이가 적당하면 그대로 추가
            result.add(parenthesisContent);
          }
        }

        start = i; // 괄호 다음 위치부터 새로운 세그먼트 시작
      } else if (text[i] == ' ' && !inParentheses) {
        // 공백을 만났고 괄호 안이 아니면 현재까지의 단어 추가
        if (i > start && text.substring(start, i).trim().isNotEmpty) {
          result.add(text.substring(start, i).trim());
        }
        start = i + 1; // 공백 다음 위치부터 새로운 세그먼트 시작
      }
    }

    // 마지막 세그먼트 추가
    if (start < text.length && text.substring(start).trim().isNotEmpty) {
      result.add(text.substring(start).trim());
    }

    return result;
  }

  // 비디오 파일명과 일치하는 썸네일 찾기
  String? _findMatchingThumbnail(String videoFileName) {
    // 같은 파일명을 가진 썸네일 찾기
    for (String thumbnailPath in _thumbnailFiles) {
      String thumbnailFileName = path.basename(thumbnailPath);
      // 확장자 제거
      thumbnailFileName = thumbnailFileName.substring(0, thumbnailFileName.lastIndexOf('.'));

      // 비디오 파일명과 썸네일 파일명이 일치하면 해당 썸네일 반환
      if (thumbnailFileName == videoFileName) {
        print('썸네일 찾음: $thumbnailPath');
        return thumbnailPath;
      }
    }

    print('썸네일 찾지 못함: $videoFileName');
    return null;
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
