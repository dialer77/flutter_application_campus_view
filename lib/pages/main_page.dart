import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:flutter_application_campus_view/pages/college%20_menu.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

// RouteObserver 인스턴스를 생성 (main.dart에서 MaterialApp에 등록해야 함)
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin, RouteAware {
  // 애니메이션 전환 지점 값 설정 (0부터 1 사이의 값)
  final double animationTransitionPoint = 0.5;
  // hover 상태를 추적하는 변수 추가
  bool isHovering = false;
  // 현재 표시되는 페이지 (true: 캠퍼스 목록, false: 메인 페이지)
  bool showCampusList = false;
  // 애니메이션이 이미 시작되었는지 확인하는 플래그
  bool animationStarted = false;

  // 캠퍼스 목록 애니메이션 컨트롤러
  late AnimationController _animationController;
  late Animation<double> _mainImageAnimation;
  Timer? _autoStartTimer;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  // 애니메이션 초기화 메서드 추출 (재사용을 위해)
  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _mainImageAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );

    // 애니메이션 상태 리스너 수정
    _animationController.addListener(() {
      // 애니메이션이 30% 이상 진행되면 showCampusList를 true로 설정
      if (_animationController.value > 0.3 && !showCampusList) {
        setState(() {
          showCampusList = true;
        });
      } else if (_animationController.value <= 0.3 && showCampusList) {
        setState(() {
          showCampusList = false;
        });
      }
    });
  }

  // 페이지를 초기 상태로 리셋
  void _resetPage() {
    // 애니메이션 컨트롤러 리셋
    _animationController.reset();

    // 상태 초기화
    setState(() {
      showCampusList = false;
      animationStarted = false;
    });
  }

  // 애니메이션 시작 메서드
  void startAnimation() {
    if (!animationStarted) {
      setState(() {
        animationStarted = true;
      });
      _animationController.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouteObserver에 현재 페이지 등록
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    // 다른 페이지에서 현재 페이지로 돌아왔을 때 호출됨
    _resetPage();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _autoStartTimer?.cancel();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면 크기 계산
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // 메인 이미지의 초기 크기와 위치 (중앙)
    final initialImageSize = screenWidth * 0.45; // 큰 이미지 크기
    final finalImageSize = screenWidth * 0.22; // 그리드 셀 이미지 크기

    // 이미지 최종 위치 계산 (캠퍼스 리스트의 첫 번째 셀 위치)
    final finalPositionTop = screenHeight * 0.22;
    final finalPositionLeft = screenWidth * 0.075 / 2; // 그리드 시작 위치

    return Scaffold(
      body: GestureDetector(
        onTap: startAnimation, // 화면 어디든 클릭하면 애니메이션 시작
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/main_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),

              // 메인 이미지 (애니메이션으로 크기와 위치가 변경됨)
              AnimatedBuilder(
                animation: _mainImageAnimation,
                builder: (context, child) {
                  // 애니메이션 값에 따라 이미지 크기와 위치 계산
                  final currentSize = initialImageSize - (_mainImageAnimation.value * (initialImageSize - finalImageSize));

                  // 메인 페이지에서의 시작 위치를 화면 중앙보다 아래로 조정 (screenHeight * 0.13만큼 아래로)
                  final initialTop = screenHeight / 2 - initialImageSize / 2 + (screenHeight * 0.13);

                  // 상태 변경과 관계없이 항상 같은 공식으로 애니메이션 처리
                  final currentTop = initialTop - (_mainImageAnimation.value * (initialTop - finalPositionTop));

                  final initialLeft = screenWidth / 2 - initialImageSize / 2;
                  final currentLeft = initialLeft - (_mainImageAnimation.value * (initialLeft - finalPositionLeft));

                  return Positioned(
                    top: currentTop,
                    left: currentLeft,
                    child: SizedBox(
                      width: currentSize,
                      height: currentSize / 1.84, // 가로세로 비율 유지
                      child: Image.asset(
                        'assets/button_icons/campus_main.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),

              // 캠퍼스 목록 그리드 (애니메이션 중에도 표시되도록 조건 변경)
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.27),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.925,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: MediaQuery.of(context).size.width * 0.015,
                        mainAxisSpacing: MediaQuery.of(context).size.height * 0.045,
                        childAspectRatio: 2.6,
                      ),
                      itemCount: _animationController.value > 0 ? 8 : 0, // 애니메이션이 시작되면 그리드 표시
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // 첫 번째 셀은 이미 Positioned 위젯으로 처리했으므로 투명한 공간으로 처리
                          return const SizedBox.shrink();
                        } else {
                          // 나머지 셀은 버튼으로 구현
                          return _buildImageButton(index);
                        }
                      },
                    ),
                  ),
                ),
              ),

              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  // 애니메이션 진행에 따라 버튼 Opacity 계산 (1.0 -> 0.0)
                  // 처음 30%는 완전히 보이고, 그 후 70%에 걸쳐 서서히 사라짐
                  final buttonOpacity = _animationController.value < 0.3 ? 1.0 : 1.0 - ((_animationController.value - 0.3) / 0.7);

                  // 애니메이션이 완료되면 버튼 완전히 숨김
                  if (_animationController.value >= 1.0) {
                    return const SizedBox.shrink();
                  }

                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.885),
                      child: Opacity(
                        opacity: buttonOpacity.clamp(0.0, 1.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.11,
                          child: MouseRegion(
                            onEnter: (_) => setState(() => isHovering = true),
                            onExit: (_) => setState(() => isHovering = false),
                            child: GestureDetector(
                              onTap: () {
                                startAnimation();
                              },
                              child: Image.asset(
                                isHovering
                                    ? 'assets/button_icons/button_next_hover.png' // hover 시 이미지
                                    : 'assets/button_icons/button_next.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getButtonImage(int index) {
    // index가 1~7이므로 실제 이미지 인덱스는 0~6
    return 'assets/button_icons/campus$index.jpg';
  }

  String _getUnivName(int index) {
    switch (index) {
      case 1:
        return 'AI융합대학';
      case 2:
        return '경영대학';
      case 3:
        return '공과대학';
      case 4:
        return '생명보건대학';
      case 5:
        return '예체능대학';
      case 6:
        return '인문사회대학';
      case 7:
        return '자유전공대학';
      default:
        return '';
    }
  }

  Widget _buildImageButton(int index) {
    bool isHovered = false;

    // 각 버튼마다 다른 지연 시간 계산 (0.1초씩 차이)
    final delay = (index - 1) * 0.1; // index-1로 변경 (첫 셀은 이미지라서)
    // 애니메이션 시작 시점을 다르게 설정
    final Animation<double> animation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(delay, 1.0, curve: Curves.easeOutBack),
    );

    // 4열 그리드에서 몇 번째 열인지 계산 (0, 1, 2, 3)
    final int column = index % 4;
    // 몇 번째 행인지 계산 (0, 1)
    final int row = index ~/ 4;

    // 시작 오프셋 계산
    Offset getStartOffset() {
      // 위치에 따른 시작점 계산
      double dx = 0;
      if (column == 0)
        dx = -300; // 왼쪽 첫 열
      else if (column == 1)
        dx = -150; // 왼쪽에서 두번째 열
      else if (column == 2)
        dx = 150; // 오른쪽에서 두번째 열
      else if (column == 3) dx = 300; // 오른쪽 마지막 열

      // 상단 행은 위에서, 하단 행은 아래에서 시작
      double dy = row == 0 ? -200 : 200;

      return Offset(dx, dy);
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        // 시작 오프셋에서 목표 위치(0,0)로 이동
        final Offset startOffset = getStartOffset();
        final Offset currentOffset = Offset(
          startOffset.dx * (1 - animation.value),
          startOffset.dy * (1 - animation.value),
        );

        return Transform.translate(
          offset: currentOffset,
          // 바깥쪽 Opacity는 애니메이션 효과용
          child: Opacity(
            opacity: animation.value.clamp(0.0, 1.0),
            child: StatefulBuilder(builder: (context, setState) {
              return
                  // 안쪽 Opacity는 호버 효과용
                  Opacity(
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
                        overleafColor: Colors.white,
                        animationTransitionPoint: animationTransitionPoint,
                        transitionDuration: const Duration(milliseconds: 1000),
                        reverseTransitionDuration: const Duration(milliseconds: 800),
                        builder: (context) => CollegeMenu(collegeType: CollegeType.values[index - 1]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            _getButtonImage(index),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        Center(
                          child: Stack(
                            children: [
                              // 텍스트의 테두리 효과를 위한 그림자 텍스트들
                              Text(
                                _getUnivName(index),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.width * 0.022,
                                  color: Colors.white, // 테두리 색상
                                ),
                                textAlign: TextAlign.center,
                              ),
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
            }),
          ),
        );
      },
    );
  }
}
