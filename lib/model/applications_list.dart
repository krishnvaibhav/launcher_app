import 'package:launcher_app_final/model/apps_model.dart';

class MyApplications {

  final List<Apps> applications = [
    Apps(
        name: "Eyesea",
        packageName: "com.mariapps.eyesea.eye_sea",
        imgLink: 'assets/eyesea.jpg'),
    Apps(
        name: "Seafarer Portal (BSM)",
        packageName: "com.issacbs_shipmanagement.rio.seafarerportalandroid",
        imgLink: 'assets/seafarer.jpg'),
    Apps(
        name: "BSM eXtrack",
        packageName: "com.mariapps.expenseclaim.android",
        imgLink: 'assets/extract.jpg'),

  ];
}