import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:launcher_app_final/constants/colors.dart';
import 'package:launcher_app_final/model/apps_model.dart';

class LaunchItem extends StatelessWidget {
  const LaunchItem({required this.app ,super.key});

  Future<void> launchApp(String package) async {
    await LaunchApp.openApp(
        androidPackageName: package, openStore: false);
  }

  final Apps app;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>launchApp(app.packageName),
      child: Card(
        color: MyColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.secondaryColor
                  ),
                  child: Image.asset(app.imgLink,width: 100,),
                ),
                  SizedBox(height: 20,),
                Expanded(child: Text(app.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: MyColors.secondaryColor),))
              ],
            ),
          )
      ),
    );
  }
}
