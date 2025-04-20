enum CollegeType {
  aiFusion('AI융합대학'),
  business('경영대학'),
  engineering('공과대학'),
  lifeAndHealthSciences('생명보건대학'),
  artsAndPhysicalEducation('예체능대학'),
  humanitiesAndSocialSciences('인문사회대학'),
  liberalStudies('자유전공학부');

  final String displayName;

  const CollegeType(this.displayName);
}

enum DepartmentType {
  None(CollegeType.business, ''),

  // AI융합대학 학부 추가
  gameSoftware(CollegeType.aiFusion, '게임소프트웨어학과'),
  semiconductorEngineering(CollegeType.aiFusion, '반도체공학과'),
  bigDataAI(CollegeType.aiFusion, '빅데이터AI학부'),
  electronicEngineering(CollegeType.aiFusion, '전자공학과'),
  intelligentRobotics(CollegeType.aiFusion, '지능로봇학과'),
  computerEngineering(CollegeType.aiFusion, '컴퓨터공학부'),

  // 경영대학 학부 추가
  businessAdministration(CollegeType.business, '경영학부'),
  globalCommerce(CollegeType.business, '글로벌통상학과'),
  digitalFinanceManagement(CollegeType.business, '디지털금융경영학과'),

  // 공과대학 학부 추가
  architecturalCivilEngineering(CollegeType.engineering, '건축토목공학부'),
  futureMobilityEngineering(CollegeType.engineering, '미래자동차공학과'),
  safetyEngineering(CollegeType.engineering, '안전공학과'),
  informationCommunicationEngineering(CollegeType.engineering, '정보통신공학부'),
  architecture(CollegeType.engineering, '건축학과'),
  fireDisasterPrevention(CollegeType.engineering, '소방방재학과'),
  electricalEngineering(CollegeType.engineering, '전기공학과'),
  chemicalEngineering(CollegeType.engineering, '화학공학과'),
  mechanicalEngineering(CollegeType.engineering, '기계공학과'),
  systemControlEngineering(CollegeType.engineering, '시스템제어공학과'),
  electronicMaterialsEngineering(CollegeType.engineering, '전자재료공학과'),
  environmentalEngineering(CollegeType.engineering, '환경공학과'),

  // 생명보건대학 학과 추가
  nursing(CollegeType.lifeAndHealthSciences, '간호학과'),
  biotechnology(CollegeType.lifeAndHealthSciences, '생명공학과'),
  clinicalLaboratoryScience(CollegeType.lifeAndHealthSciences, '임상병리학과'),
  animalHealthWelfare(CollegeType.lifeAndHealthSciences, '동물보건복지학과'),
  foodEngineering(CollegeType.lifeAndHealthSciences, '식품공학과'),
  pharmaceuticalEngineering(CollegeType.lifeAndHealthSciences, '제약공학과'),
  physicalTherapy(CollegeType.lifeAndHealthSciences, '물리치료학과'),
  foodNutrition(CollegeType.lifeAndHealthSciences, '식품영양학과'),
  cosmeticScience(CollegeType.lifeAndHealthSciences, '화장품과학과'),

  // 예체능대학 학과 추가
  golfIndustry(CollegeType.artsAndPhysicalEducation, '골프산업학과'),
  cultureAndMedia(CollegeType.artsAndPhysicalEducation, '문화영상학부'),
  practicalMusic(CollegeType.artsAndPhysicalEducation, '실용음악과'),
  theaterTrack(CollegeType.artsAndPhysicalEducation, '연극트랙'),
  designSchool(CollegeType.artsAndPhysicalEducation, '디자인스쿨'),
  sportsForAll(CollegeType.artsAndPhysicalEducation, '사회체육학과'),
  animation(CollegeType.artsAndPhysicalEducation, '애니메이션학과'),

  // 인문사회과학대학 학과 추가
  christianStudies(CollegeType.humanitiesAndSocialSciences, '기독교학과'),
  socialWelfare(CollegeType.humanitiesAndSocialSciences, '사회복지학부'),
  earlyChildhoodEducation(CollegeType.humanitiesAndSocialSciences, '유아교육과'),
  koreanLanguageCulture(CollegeType.humanitiesAndSocialSciences, '한국언어문화학과'),
  mediaCommunication(CollegeType.humanitiesAndSocialSciences, '미디어\n커뮤니케이션학과'),
  industrialPsychology(CollegeType.humanitiesAndSocialSciences, '산업심리학과'),
  chineseStudies(CollegeType.humanitiesAndSocialSciences, '중국학과'),
  aviationService(CollegeType.humanitiesAndSocialSciences, '항공서비스학과'),
  lawPoliceAdministration(CollegeType.humanitiesAndSocialSciences, '법경찰행정학과'),
  englishLanguageLiterature(CollegeType.humanitiesAndSocialSciences, '영어영문학과'),
  youthCultureCounseling(CollegeType.humanitiesAndSocialSciences, '청소년문화상담학과'),

  // 자유전공학부 추가
  liberalArtsUndeclared(CollegeType.liberalStudies, '자유전공학과');

  final CollegeType collegeType;
  final String displayName;

  const DepartmentType(this.collegeType, this.displayName);
}
