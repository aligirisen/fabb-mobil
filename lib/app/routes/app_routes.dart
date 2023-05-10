part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const onboarding = _Paths.onboarding;

  static const login = _Paths.login;
  static const signup = _Paths.signup;
  static const home = _Paths.home;
  static const myreports = _Paths.myreports;
  static const settings = _Paths.settings;
  static const contact = _Paths.contact;
  static const map = _Paths.map;

  //creating an accident
  static const incidentType = _Paths.incidentType;
  static const incidentDetails = _Paths.incidentDetails;
  static const succcesfulyReportedPage = _Paths.succcesfulyReportedPage;
  static const guestNewIncident = _Paths.guestNewIncident;
}

abstract class _Paths {
  static const onboarding = '/onboarding';

  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const myreports = '/myreports';
  static const settings = '/settings';
  static const contact = '/contact';
  static const map = '/mapscreen';

  //creating an accident
  static const incidentType = '/accidentType';
  static const incidentDetails = '/incidentDetails';
  static const succcesfulyReportedPage = '/succcesfulyReportedPage';
  static const guestNewIncident = '/guestNewIncident';
}
