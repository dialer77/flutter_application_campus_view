enum CollegeType {
  business,
  engineering,
  lifeAndHealthSciences,
  artsAndPhysicalEducation,
  humanitiesAndSocialSciences,
  liberalStudies,
}

enum BusinessDepartment {
  businessAdministration('경영학부'),
  globalCommerce('글로벌통상학과'),
  digitalFinanceManagement('디지털금융경영학과'),
  digitalTechnologyManagement('디지털기술경영학과');

  final String displayName;

  const BusinessDepartment(this.displayName);
}
