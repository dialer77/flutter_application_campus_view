// 대각선으로 화면을 나누는 클리퍼
import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  final bool isTopPart;

  DiagonalClipper({required this.isTopPart});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (isTopPart) {
      // 왼쪽 상단에서 20% 지점에서 오른쪽 하단 80% 지점까지의 경로
      path.moveTo(size.width * 0.2, 0); // 왼쪽 20% 지점 상단
      path.lineTo(size.width * 0.8, size.height); // 오른쪽 하단 80% 지점
      path.lineTo(size.width, size.height); // 우하단
      path.lineTo(size.width, 0); // 우상단
      path.close();
    } else {
      // 왼쪽 상단 20% 지점에서 오른쪽 하단까지의 경로
      path.moveTo(0, 0); // 좌상단
      path.lineTo(0, size.height); // 좌하단
      path.lineTo(size.width * 0.8, size.height); // 우하단
      path.lineTo(size.width * 0.2, 0); // 왼쪽 20% 지점 상단
      path.close();
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
