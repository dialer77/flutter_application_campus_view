import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoViewer extends StatefulWidget {
  final String videoPath;

  const VideoViewer({super.key, required this.videoPath});

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> with SingleTickerProviderStateMixin {
  // 플레이어 및 컨트롤러 인스턴스
  late final Player player;
  late final VideoController controller;

  String _errorMessage = '';
  bool _isLoading = true;
  bool _showControls = false;
  bool _isVideoReady = false; // 비디오가 준비되었는지 확인

  // 중앙에서 좌우로 퍼지는 애니메이션을 위한 변수
  double _revealWidth = 1.0; // 처음에는 1픽셀 너비로 시작
  double _maxWidth = 0.0;

  late AnimationController _animationController;
  late Animation<double> _animation;

  Timer? _hideControlsTimer;
  Timer? _goBackTimer;

  // 재생 완료 구독
  StreamSubscription? _completedSubscription;
  // 재생 상태 변경 구독
  StreamSubscription? _playingSubscription;

  bool _useContainMode = false;

  @override
  void initState() {
    super.initState();
    // 전체 화면 및 가로 모드 설정
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200), // 애니메이션 지속 시간
      vsync: this,
    );

    // 플레이어 초기화
    player = Player();
    controller = VideoController(player);

    // 비디오 재생 완료 이벤트 리스너 등록
    _completedSubscription = player.stream.completed.listen((completed) {
      if (completed && mounted) {
        print('비디오 재생 완료. 2초 후 뒤로가기 진행...');

        // 기존 타이머가 있으면 취소
        _goBackTimer?.cancel();

        // 2초 후에 뒤로가기 실행
        _goBackTimer = Timer(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });

    // 재생 상태 변경 이벤트 리스너 등록 - UI 업데이트를 위해
    _playingSubscription = player.stream.playing.listen((playing) {
      if (mounted) {
        setState(() {
          // 상태 변경 시 UI 갱신만 수행
        });
      }
    });

    _initializePlayer();
  }

  void _initializePlayer() async {
    try {
      // 파일 존재 확인
      final file = File(widget.videoPath);
      if (!await file.exists()) {
        setState(() {
          _errorMessage = '파일을 찾을 수 없습니다: ${widget.videoPath}';
          _isLoading = false;
        });
        print(_errorMessage);
        return;
      }

      print('비디오 로딩 시작: ${widget.videoPath}');

      // 미디어 열기
      await player.open(Media(widget.videoPath));

      // 일단 비디오를 일시정지 상태로 설정
      player.pause();

      setState(() {
        _isLoading = false;
        _isVideoReady = true;
      });

      print('비디오 초기화 성공!');

      await _waitForVideoParams();
      // 화면 크기를 알기 위해 약간 지연
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          // 고정 지연 시간 대신 비디오 파라미터가 준비될 때까지 대기

          final videoWidth = player.state.videoParams.dw;
          final videoHeight = player.state.videoParams.dh;

          double videoRatio = videoWidth! / videoHeight!;

          // 화면 너비를 기반으로 애니메이션 설정
          final size = MediaQuery.of(context).size;
          _maxWidth = size.width;
          final videoScreenWidth = videoRatio * size.height;

          // 애니메이션 설정
          _animation = Tween<double>(
            begin: 1.0,
            end: _maxWidth,
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutQuart, // 부드러운 효과
          ));

          // 애니메이션 리스너 추가
          _animation.addListener(() {
            if (mounted) {
              final bool isAnimationCompleted = _animation.value >= videoScreenWidth;

              print('animation value: ${_animation.value}');

              setState(() {
                _revealWidth = _animation.value;

                // 애니메이션 완료 여부에 따른 추가 작업이 필요하다면 여기서 수행
                if (isAnimationCompleted) {
                  _useContainMode = true;
                  // 예: 애니메이션이 막 완료되었을 때 한 번만 실행할 코드
                  print('애니메이션 완료됨');
                }
              });
            }
          });

          // 애니메이션 시작
          _animationController.forward();

          // 애니메이션이 완료된 후 비디오 재생 시작
          _animationController.addStatusListener((status) {
            if (status == AnimationStatus.completed && mounted) {
              player.play();
            }
          });
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = '비디오 초기화 오류: $e';
        _isLoading = false;
      });
      print(_errorMessage);
    }
  }

  // 비디오 파라미터가 준비될 때까지 대기하는 함수
  Future<void> _waitForVideoParams() async {
    // 최대 시도 횟수 설정 (무한 루프 방지)
    const maxAttempts = 20;
    int attempts = 0;

    while (attempts < maxAttempts) {
      if (!mounted) return;

      final videoWidth = player.state.videoParams.dw;
      final videoHeight = player.state.videoParams.dh;

      // 비디오 파라미터가 준비된 경우
      if (videoWidth != null && videoHeight != null && videoWidth > 0 && videoHeight > 0) {
        double videoRatio = videoWidth / videoHeight;
        return; // Exit once we have valid parameters
      }

      // 100ms 대기 후 다시 시도
      await Future.delayed(const Duration(milliseconds: 300));
      attempts++;
    }

    // 최대 시도 횟수에 도달했을 때 처리 (선택적)
    if (mounted) {
      print('비디오 파라미터를 읽어오지 못했습니다.');
      // 대체 로직 실행 또는 기본값 사용
    }
  }

  // 컨트롤 표시 토글
  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });

    // 타이머 취소
    _hideControlsTimer?.cancel();

    // 컨트롤이 표시되면 5초 후 자동으로 숨김
    if (_showControls) {
      _hideControlsTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _showControls = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _goBackTimer?.cancel(); // 뒤로가기 타이머 취소
    _completedSubscription?.cancel();
    _playingSubscription?.cancel();
    _animationController.dispose();
    // 앱 종료 시 전체 화면 해제
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 제거
      appBar: null,
      // 배경색 검정으로 설정
      backgroundColor: Colors.black,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white, // 로딩 인디케이터 색상을 흰색으로
              ),
            )
          : _errorMessage.isNotEmpty
              ? _buildErrorWidget()
              : _buildFullScreenVideo(),
    );
  }

  Widget _buildFullScreenVideo() {
    // 현재 비디오가 재생 중인지 여부 확인
    final isPlaying = player.state.playing;
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: _toggleControls, // 화면 탭하면 컨트롤 토글
      child: Stack(
        children: [
          // 검정색 배경
          Container(color: Colors.black),

          // 중앙 세로선에서 좌우로 퍼지는 비디오
          if (_isVideoReady)
            Center(
              child: ClipRect(
                child: SizedBox(
                  width: _revealWidth, // 애니메이션되는 너비
                  height: screenSize.height,
                  child: Video(
                    controller: controller,
                    wakelock: true,
                    fit: _useContainMode ? BoxFit.contain : BoxFit.cover, // 미리 결정된 fit 모드 사용
                  ),
                ),
              ),
            ),

          // 뒤로가기 버튼 (일시정지 상태일 때만 표시)
          if (!isPlaying)
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),

          // 컨트롤 오버레이 (표시될 때만)
          if (_showControls)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3), // 반투명 오버레이
                child: Center(
                  child: IconButton(
                    iconSize: 64,
                    icon: Icon(
                      isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isPlaying) {
                          player.pause();
                        } else {
                          player.play();
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            '오류 발생',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '파일 경로: ${widget.videoPath}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('뒤로 가기'),
          ),
        ],
      ),
    );
  }
}
