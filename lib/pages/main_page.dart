import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/layouts/diagonal_background_layout.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 버튼 아이템 정보를 정의
  final List<Map<String, dynamic>> buttonItems = [
    {
      'title': '캠퍼스 맵',
      'icon': Icons.map,
      'color': Colors.blue[300],
      'onTap': () {
        // 캠퍼스 맵 페이지로 이동
      },
    },
    {
      'title': '시설 안내',
      'icon': Icons.business,
      'color': Colors.green[300],
      'onTap': () {
        // 시설 안내 페이지로 이동
      },
    },
    {
      'title': '공지사항',
      'icon': Icons.announcement,
      'color': Colors.orange[300],
      'onTap': () {
        // 공지사항 페이지로 이동
      },
    },
    {
      'title': '학사 일정',
      'icon': Icons.calendar_today,
      'color': Colors.purple[300],
      'onTap': () {
        // 학사 일정 페이지로 이동
      },
    },
    {
      'title': '학과 정보',
      'icon': Icons.school,
      'color': Colors.teal[300],
      'onTap': () {
        // 학과 정보 페이지로 이동
      },
    },
    {
      'title': '연락처',
      'icon': Icons.contact_phone,
      'color': Colors.red[300],
      'onTap': () {
        // 연락처 페이지로 이동
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DiagonalBackgroundLayout(
        topColor: Colors.red[300]!,
        bottomColor: Colors.indigo[100]!,
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.8, // 화면 높이의 60%
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3열
                  childAspectRatio: 0.9, // 버튼 비율 조정
                  crossAxisSpacing: 8.0, // 간격 줄임
                  mainAxisSpacing: 8.0, // 간격 줄임
                ),
                itemCount: buttonItems.length,
                itemBuilder: (context, index) {
                  return _buildGridItem(buttonItems[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item) {
    return Card(
      elevation: 3, // 그림자 줄임
      margin: const EdgeInsets.all(4), // 카드 마진 줄임
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: item['onTap'],
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                item['color'],
                item['color'].withOpacity(0.7),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item['icon'],
                size: 28, // 아이콘 크기 더 줄임
                color: Colors.white,
              ),
              const SizedBox(height: 4), // 간격 줄임
              Text(
                item['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11, // 폰트 크기 더 줄임
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
