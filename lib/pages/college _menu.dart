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
    // 공통 Row 위젯 사용, 내부에서 switch로 content 결정
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: switch (collegeType) {
        CollegeType.aiFusion => [
            _buildImageButton({
              DepartmentType.gameSoftware: 'assets/button_icons/aiFusion/${DepartmentType.gameSoftware.name}.jpg',
              DepartmentType.electronicEngineering: 'assets/button_icons/aiFusion/${DepartmentType.electronicEngineering.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            _buildImageButton({
              DepartmentType.semiconductorEngineering: 'assets/button_icons/aiFusion/${DepartmentType.semiconductorEngineering.name}.jpg',
              DepartmentType.intelligentRobotics: 'assets/button_icons/aiFusion/${DepartmentType.intelligentRobotics.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            _buildImageButton({
              DepartmentType.bigDataAI: 'assets/button_icons/aiFusion/${DepartmentType.bigDataAI.name}.jpg',
              DepartmentType.computerEngineering: 'assets/button_icons/aiFusion/${DepartmentType.computerEngineering.name}.jpg',
            }),
          ],
        CollegeType.business => [
            _buildImageButton({
              DepartmentType.businessAdministration: 'assets/button_icons/business/${DepartmentType.businessAdministration.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            _buildImageButton({
              DepartmentType.globalCommerce: 'assets/button_icons/business/${DepartmentType.globalCommerce.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            _buildImageButton({
              DepartmentType.digitalFinanceManagement: 'assets/button_icons/business/${DepartmentType.digitalFinanceManagement.name}.jpg',
            }),
          ],
        CollegeType.engineering => [
            _buildImageButton({
              DepartmentType.architecturalCivilEngineering: 'assets/button_icons/engineering/${DepartmentType.architecturalCivilEngineering.name}.jpg',
              DepartmentType.futureMobilityEngineering: 'assets/button_icons/engineering/${DepartmentType.futureMobilityEngineering.name}.jpg',
              DepartmentType.safetyEngineering: 'assets/button_icons/engineering/${DepartmentType.safetyEngineering.name}.jpg',
              DepartmentType.informationCommunicationEngineering: 'assets/button_icons/engineering/${DepartmentType.informationCommunicationEngineering.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.architecture: 'assets/button_icons/engineering/${DepartmentType.architecture.name}.jpg',
              DepartmentType.fireDisasterPrevention: 'assets/button_icons/engineering/${DepartmentType.fireDisasterPrevention.name}.jpg',
              DepartmentType.electricalEngineering: 'assets/button_icons/engineering/${DepartmentType.electricalEngineering.name}.jpg',
              DepartmentType.chemicalEngineering: 'assets/button_icons/engineering/${DepartmentType.chemicalEngineering.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.mechanicalEngineering: 'assets/button_icons/engineering/${DepartmentType.mechanicalEngineering.name}.jpg',
              DepartmentType.systemControlEngineering: 'assets/button_icons/engineering/${DepartmentType.systemControlEngineering.name}.jpg',
              DepartmentType.electronicMaterialsEngineering: 'assets/button_icons/engineering/${DepartmentType.electronicMaterialsEngineering.name}.jpg',
              DepartmentType.environmentalEngineering: 'assets/button_icons/engineering/${DepartmentType.environmentalEngineering.name}.jpg',
            }),
          ],
        CollegeType.lifeAndHealthSciences => [
            _buildImageButton({
              DepartmentType.nursing: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.nursing.name}.jpg',
              DepartmentType.biotechnology: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.biotechnology.name}.jpg',
              DepartmentType.clinicalLaboratoryScience: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.clinicalLaboratoryScience.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.animalHealthWelfare: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.animalHealthWelfare.name}.jpg',
              DepartmentType.foodEngineering: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.foodEngineering.name}.jpg',
              DepartmentType.pharmaceuticalEngineering: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.pharmaceuticalEngineering.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.physicalTherapy: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.physicalTherapy.name}.jpg',
              DepartmentType.foodNutrition: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.foodNutrition.name}.jpg',
              DepartmentType.cosmeticScience: 'assets/button_icons/lifeAndHealthSciences/${DepartmentType.cosmeticScience.name}.jpg',
            }),
          ],
        CollegeType.artsAndPhysicalEducation => [
            _buildImageButton({
              DepartmentType.golfIndustry: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.golfIndustry.name}.jpg',
              DepartmentType.sportsForAll: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.sportsForAll.name}.jpg',
              DepartmentType.theaterTrack: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.theaterTrack.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.designSchool: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.designSchool.name}.jpg',
              DepartmentType.practicalMusic: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.practicalMusic.name}.jpg',
              DepartmentType.None: '',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.cultureAndMedia: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.cultureAndMedia.name}.jpg',
              DepartmentType.animation: 'assets/button_icons/artsAndPhysicalEducation/${DepartmentType.animation.name}.jpg',
              DepartmentType.None: '',
            }),
          ],
        CollegeType.humanitiesAndSocialSciences => [
            _buildImageButton({
              DepartmentType.christianStudies: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.christianStudies.name}.jpg',
              DepartmentType.socialWelfare: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.socialWelfare.name}.jpg',
              DepartmentType.earlyChildhoodEducation: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.earlyChildhoodEducation.name}.jpg',
              DepartmentType.koreanLanguageCulture: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.koreanLanguageCulture.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.mediaCommunication: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.mediaCommunication.name}.jpg',
              DepartmentType.industrialPsychology: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.industrialPsychology.name}.jpg',
              DepartmentType.chineseStudies: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.chineseStudies.name}.jpg',
              DepartmentType.aviationService: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.aviationService.name}.jpg',
            }),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            _buildImageButton({
              DepartmentType.lawPoliceAdministration: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.lawPoliceAdministration.name}.jpg',
              DepartmentType.englishLanguageLiterature: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.englishLanguageLiterature.name}.jpg',
              DepartmentType.youthCultureCounseling: 'assets/button_icons/humanitiesAndSocialSciences/${DepartmentType.youthCultureCounseling.name}.jpg',
              DepartmentType.None: '',
            }),
          ],
        CollegeType.liberalStudies => [
            _buildImageButton({
              DepartmentType.liberalArtsUndeclared: 'assets/button_icons/liberalStudies/${DepartmentType.liberalArtsUndeclared.name}.jpg',
            }),
          ],
        _ => <Widget>[]
      },
    );
  }

  Widget _buildImageButton(Map<DepartmentType, String> departmentTypes) {
    CollegeType collegeType = widget.collegeType;

    double width = 0;
    double height = 0;
    double heightGap = 0;

    switch (collegeType) {
      case CollegeType.business:
        width = MediaQuery.of(context).size.width * 0.25;
        height = MediaQuery.of(context).size.height * 0.15;
        heightGap = MediaQuery.of(context).size.height * 0.045;
        break;
      case CollegeType.liberalStudies:
        width = MediaQuery.of(context).size.width * 0.38;
        height = MediaQuery.of(context).size.height * 0.22;
        heightGap = MediaQuery.of(context).size.height * 0.05;
        break;
      default:
        width = MediaQuery.of(context).size.width * 0.215;
        height = MediaQuery.of(context).size.height * 0.125;
        heightGap = MediaQuery.of(context).size.height * 0.0175;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...(() {
          List<Widget> columnWidgets = [];
          for (int i = 0; i < departmentTypes.length; i++) {
            DepartmentType departmentType = departmentTypes.keys.toList()[i];

            columnWidgets.add(SizedBox(height: heightGap));
            if (departmentType == DepartmentType.None) {
              columnWidgets.add(SizedBox(width: width, height: height));
              continue;
            }

            columnWidgets.add(SizedBox(
              width: width,
              height: height,
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
                child: Opacity(
                  opacity: isTextHovering[departmentType] ?? false ? 1 : 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(departmentTypes[departmentType] ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        departmentType.displayName,
                        style: TextStyle(
                          color: isTextHovering[departmentType] ?? false
                              ? const Color.fromARGB(255, 155, 32, 39) // 호버 시 빨간색
                              : const Color.fromARGB(255, 11, 71, 137),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.023,
                          fontFamily: 'ROKAF Sans',
                          shadows: const [
                            // 텍스트 테두리 효과
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.white,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(-1, 1),
                              color: Colors.white,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(1, -1),
                              color: Colors.white,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(-1, -1),
                              color: Colors.white,
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
            ));
          }
          return columnWidgets;
        }()),
      ],
    );
  }
}
