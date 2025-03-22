import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/utils/diagonal_clipper.dart';

class DiagonalBackgroundLayout extends StatelessWidget {
  final Widget child;
  final Color topColor;
  final Color bottomColor;
  final DecorationImage? topImage;
  final DecorationImage? bottomImage;

  const DiagonalBackgroundLayout({
    super.key,
    required this.child,
    this.topColor = const Color(0xFFEF9A9A), // Colors.red[300] 기본값
    this.bottomColor = const Color(0xFFD1C4E9), // Colors.indigo[100] 기본값
    this.topImage,
    this.bottomImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 배경 영역 1 - 위쪽 부분
        ClipPath(
          clipper: DiagonalClipper(isTopPart: true),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: topImage == null ? topColor : null,
            decoration: topImage != null
                ? BoxDecoration(
                    image: topImage,
                  )
                : null,
          ),
        ),

        // 배경 영역 2 - 아래쪽 부분
        ClipPath(
          clipper: DiagonalClipper(isTopPart: false),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: bottomImage == null ? bottomColor : null,
            decoration: bottomImage != null
                ? BoxDecoration(
                    image: bottomImage,
                  )
                : null,
          ),
        ),

        // 자식 위젯
        child,
      ],
    );
  }
}
