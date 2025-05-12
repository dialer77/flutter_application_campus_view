import 'dart:async';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoViewerWeb extends StatefulWidget {
  final String videoUrl;
  final double aspectRatio;

  const VideoViewerWeb({super.key, required this.videoUrl, required this.aspectRatio});

  @override
  State<VideoViewerWeb> createState() => _VideoViewerWebState();
}

class _VideoViewerWebState extends State<VideoViewerWeb> with SingleTickerProviderStateMixin {
  // 플레이어 및 컨트롤러 인스턴스
  late final Player player;
  late final VideoController controller;

  String _errorMessage = '';
  bool _isLoading = true;
  bool _showControls = false;
  bool _isVideoReady = false;
  bool _isImageFile = false;

  // 중앙에서 좌우로 퍼지는 애니메이션을 위한 변수
  double _revealWidth = 1.0;
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
    // 웹에서는 전체 화면 모드 처리가 다름
    // 브라우저 API 사용을 위한 별도 처리 필요

    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // 플레이어 초기화
    player = Player();
    controller = VideoController(player);

    // 비디오 재생 완료 이벤트 리스너 등록
    _completedSubscription = player.stream.completed.listen((completed) {
      if (completed && mounted) {
        print('비디오 재생 완료. 2초 후 뒤로가기 진행...');

        _goBackTimer?.cancel();

        _goBackTimer = Timer(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });

    // 재생 상태 변경 이벤트 리스너 등록
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
      // 파일 확장자 확인 (URL에서 추출)
      final String extension = widget.videoUrl.split('.').last.toLowerCase();
      final List<String> imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'heic'];

      if (imageExtensions.contains(extension)) {
        print('이미지 파일 감지: ${widget.videoUrl}');
        setState(() {
          _isLoading = false;
          _isImageFile = true;
        });

        // 3초 후 자동으로 뒤로가기
        Timer(const Duration(seconds: 3), () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });

        return;
      }

      print('비디오 로딩 시작: ${widget.videoUrl}');

      // 변환된 경로로 미디어 열기
      await player.open(Media(widget.videoUrl));

      // 일단 비디오를 일시정지 상태로 설정
      player.pause();

      setState(() {
        _isLoading = false;
        _isVideoReady = true;
      });

      print('비디오 초기화 성공!');

      await Future.delayed(const Duration(milliseconds: 1500));
      // bool isVideoParamsReady = await _waitForVideoParams();

      double videoRatio = widget.aspectRatio;

      // 화면 너비를 기반으로 애니메이션 설정
      final size = MediaQuery.of(context).size;
      _maxWidth = size.width;
      final videoScreenWidth = videoRatio * size.height;

      print('애니메이션 설정');
      // 애니메이션 설정
      _animation = Tween<double>(
        begin: 0.0,
        end: _maxWidth,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuart,
      ));

      print('애니메이션 리스너 추가');
      // 애니메이션 리스너 추가
      _animation.addListener(() {
        if (mounted) {
          final bool isAnimationCompleted = _animation.value >= videoScreenWidth;

          setState(() {
            _revealWidth = _animation.value;

            if (isAnimationCompleted) {
              _useContainMode = true;
              print('애니메이션 완료됨');
            }
          });
        }
      });

      print('애니메이션 시작');
      // 애니메이션 시작
      _animationController.forward();

      // 애니메이션이 완료된 후 비디오 재생 시작
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          print('애니메이션 완료 후 비디오 재생');
          player.play();
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
  Future<bool> _waitForVideoParams() async {
    const maxAttempts = 5;
    int attempts = 0;

    while (attempts < maxAttempts) {
      if (!mounted) return true;

      final videoWidth = player.state.videoParams.dw;
      final videoHeight = player.state.videoParams.dh;

      if (videoWidth != null && videoHeight != null && videoWidth > 0 && videoHeight > 0) {
        return true;
      }

      await Future.delayed(const Duration(milliseconds: 300));
      attempts++;
    }

    if (mounted) {
      print('비디오 파라미터를 읽어오지 못했습니다.');
    }

    return mounted == false;
  }

  // 컨트롤 표시 토글
  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });

    _hideControlsTimer?.cancel();

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

  // 전체 화면 토글 (웹용)
  void _toggleFullScreen() {
    // 웹에서는 JavaScript 인터롭을 통해 전체화면 API를 호출해야 함
    // 여기서는 기본 동작만 구현
    print('웹 전체화면 토글');
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _goBackTimer?.cancel();
    _completedSubscription?.cancel();
    _playingSubscription?.cancel();
    _animationController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.fullscreen, color: Colors.white),
            onPressed: _toggleFullScreen,
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : _errorMessage.isNotEmpty
              ? _buildErrorWidget()
              : _isImageFile
                  ? _buildImageViewer()
                  : _buildFullScreenVideo(),
    );
  }

  Widget _buildFullScreenVideo() {
    final isPlaying = player.state.playing;
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: _toggleControls,
      child: Stack(
        children: [
          // 검정색 배경
          Container(color: Colors.black),

          // 중앙 세로선에서 좌우로 퍼지는 비디오
          if (_isVideoReady)
            Center(
              child: ClipRect(
                child: SizedBox(
                  width: _revealWidth,
                  height: screenSize.height,
                  child: Video(
                    controller: controller,
                    wakelock: true,
                    fit: _useContainMode ? BoxFit.contain : BoxFit.cover,
                  ),
                ),
              ),
            ),

          // 컨트롤 오버레이 (표시될 때만)
          if (_showControls)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3),
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
            'URL: ${widget.videoUrl}',
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

  Widget _buildImageViewer() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Image.network(
          widget.videoUrl,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                color: Colors.white,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text('이미지를 불러올 수 없습니다: $error', style: const TextStyle(color: Colors.white)),
              ],
            );
          },
        ),
      ),
    );
  }
}
