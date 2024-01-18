import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/download_callbacks.dart';
import 'package:launcher_app_final/Widgets/launch_item.dart';
import 'package:launcher_app_final/constants/colors.dart';
import 'package:launcher_app_final/model/applications_list.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  var channel = const MethodChannel('installApp');

  showToast() {
    channel.invokeMethod('showToast');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          toolbarHeight: 100,
          title: const Center(
              child: Text(
            "MA-LAUNCHER",
            style: TextStyle(color: MyColors.secondaryColor),
          )),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: () {
              showToast();
            },
            backgroundColor: MyColors.primaryColor,
            child: Icon(Icons.add, color: MyColors.secondaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: MyApplications().applications.length,
                  itemBuilder: (context, index) {
                    return LaunchItem(
                        app: MyApplications().applications[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
