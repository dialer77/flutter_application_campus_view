import 'package:flutter/material.dart';
import 'package:flutter_application_campus_view/commons/enum_defines.dart';
import 'package:flutter_application_campus_view/pages/video_view_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class CollegeMenu extends StatefulWidget {
  final CollegeType collegeType;
  const CollegeMenu({super.key, required this.collegeType});

  @override
  State<CollegeMenu> createState() => _CollegeMenuState();
}

class _CollegeMenuState extends State<CollegeMenu> {
  final homeHoverNotifier = ValueNotifier<bool>(false);
  bool isHovering = false;
  Map<DepartmentType, bool> isTextHovering = {};

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
            _buildDepartmentList(widget.collegeType),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.885),
                child: SizedBox(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentList(CollegeType collegeType) {
    switch (collegeType) {
      case CollegeType.business:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.015,
            right: MediaQuery.of(context).size.width * 0.015,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/${DepartmentType.businessAdministration.name}.jpg', [
                DepartmentType.businessAdministration,
              ]),
              _buildImageButton('assets/button_icons/${DepartmentType.globalCommerce.name}.jpg', [
                DepartmentType.globalCommerce,
              ]),
              _buildImageButton('assets/button_icons/${DepartmentType.digitalFinanceManagement.name}.jpg', [
                DepartmentType.digitalFinanceManagement,
              ]),
              _buildImageButton('assets/button_icons/${DepartmentType.digitalTechnologyManagement.name}.jpg', [
                DepartmentType.digitalTechnologyManagement,
              ]),
            ],
          ),
        );
      case CollegeType.engineering:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/Engineering1.jpg', [
                DepartmentType.architecturalCivilEngineering,
                DepartmentType.futureMobilityEngineering,
                DepartmentType.safetyEngineering,
                DepartmentType.informationCommunicationEngineering,
              ]),
              _buildImageButton('assets/button_icons/Engineering2.jpg', [
                DepartmentType.architecture,
                DepartmentType.fireDisasterPrevention,
                DepartmentType.electricalEngineering,
                DepartmentType.chemicalEngineering,
              ]),
              _buildImageButton('assets/button_icons/Engineering3.jpg', [
                DepartmentType.mechanicalEngineering,
                DepartmentType.systemControlEngineering,
                DepartmentType.electronicMaterialsEngineering,
                DepartmentType.environmentalEngineering,
              ]),
            ],
          ),
        );
      case CollegeType.lifeAndHealthSciences:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/lifeAndHealthSciences1.jpg', [
                DepartmentType.nursing,
                DepartmentType.biotechnology,
                DepartmentType.clinicalLaboratoryScience,
              ]),
              _buildImageButton('assets/button_icons/lifeAndHealthSciences2.jpg', [
                DepartmentType.animalHealthWelfare,
                DepartmentType.foodEngineering,
                DepartmentType.pharmaceuticalEngineering,
              ]),
              _buildImageButton('assets/button_icons/lifeAndHealthSciences3.jpg', [
                DepartmentType.physicalTherapy,
                DepartmentType.foodNutrition,
                DepartmentType.cosmeticScience,
              ]),
            ],
          ),
        );
      case CollegeType.artsAndPhysicalEducation:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/artsAndPhysicalEducation1.jpg', [
                DepartmentType.golfIndustry,
                DepartmentType.cultureAndMedia,
                DepartmentType.practicalMusic,
                DepartmentType.theaterTrack,
              ]),
              _buildImageButton('assets/button_icons/artsAndPhysicalEducation2.jpg', [
                DepartmentType.designSchool,
                DepartmentType.sportsForAll,
                DepartmentType.animation,
              ]),
            ],
          ),
        );
      case CollegeType.humanitiesAndSocialSciences:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/humanitiesAndSocialSciences1.jpg', [
                DepartmentType.christianStudies,
                DepartmentType.socialWelfare,
                DepartmentType.earlyChildhoodEducation,
                DepartmentType.koreanLanguageCulture,
              ]),
              _buildImageButton('assets/button_icons/humanitiesAndSocialSciences2.jpg', [
                DepartmentType.mediaCommunication,
                DepartmentType.industrialPsychology,
                DepartmentType.chineseStudies,
                DepartmentType.aviationService,
              ]),
              _buildImageButton('assets/button_icons/humanitiesAndSocialSciences3.jpg', [
                DepartmentType.lawPoliceAdministration,
                DepartmentType.englishLanguageLiterature,
                DepartmentType.youthCultureCounseling,
              ]),
            ],
          ),
        );
      case CollegeType.liberalStudies:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.13,
            right: MediaQuery.of(context).size.width * 0.13,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageButton('assets/button_icons/liberalStudies1.jpg', [
                DepartmentType.liberalArtsUndeclared,
              ]),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildImageButton(String imagePath, List<DepartmentType> departmentTypes) {
    // 호버 상태를 추적하기 위한 변수
    final hoverNotifier = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHovered, _) {
        return MouseRegion(
          onEnter: (_) => hoverNotifier.value = true,
          onExit: (_) => hoverNotifier.value = false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.216,
            height: MediaQuery.of(context).size.height * 0.52,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Stack(
                children: [
                  Opacity(
                    opacity: departmentTypes.any((dept) => isTextHovering[dept] == true) ? 1 : 0.7,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      color: isHovered ? null : Colors.white.withOpacity(0.7),
                      colorBlendMode: isHovered ? null : BlendMode.modulate,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (DepartmentType departmentType in departmentTypes)
                          Flexible(
                            flex: 1,
                            child: InkWell(
                              onHover: (value) => setState(() {
                                isTextHovering[departmentType] = value;
                              }),
                              onTap: () {
                                Navigator.of(context).push(
                                  TurnPageRoute(
                                    animationTransitionPoint: 0.5,
                                    transitionDuration: const Duration(milliseconds: 1000),
                                    reverseTransitionDuration: const Duration(milliseconds: 800),
                                    builder: (context) => VideoViewPage(collegeType: widget.collegeType, departmentType: departmentType),
                                  ),
                                );
                              },
                              child: SizedBox(
                                child: Center(
                                  child: Text(
                                    departmentType.displayName,
                                    style: TextStyle(
                                      color: isTextHovering[departmentType] ?? false
                                          ? const Color.fromARGB(255, 155, 32, 39) // 호버 시 빨간색
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context).size.width * 0.023,
                                      fontFamily: 'ROKAF Sans',
                                      shadows: [
                                        // 텍스트 테두리 효과
                                        Shadow(
                                          offset: const Offset(1, 1),
                                          color: isHovered ? Colors.white : Colors.black,
                                          blurRadius: 2,
                                        ),
                                        Shadow(
                                          offset: const Offset(-1, 1),
                                          color: isHovered ? Colors.white : Colors.black,
                                          blurRadius: 2,
                                        ),
                                        Shadow(
                                          offset: const Offset(1, -1),
                                          color: isHovered ? Colors.white : Colors.black,
                                          blurRadius: 2,
                                        ),
                                        Shadow(
                                          offset: const Offset(-1, -1),
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
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
