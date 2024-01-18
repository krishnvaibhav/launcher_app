package com.example.launcher_app_final;
import java.io.*;
import java.net.*;
import java.nio.*;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.file.Paths;

import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL_NAME = "installApp";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        final String apk = "https://drive.google.com/file/d/1I4LpN8OcWKHFSzOBr6hGe1TqzXPv6v06/view?usp=drivesdk";
        final String apk1 = "https://drive.google.com/file/d/1I9dQKGfqfkjde-wisykZVEfgCJ-x2qbK/view?usp=drivesdk";
        final String apk2 = "https://drive.google.com/file/d/1I2EWFLSowY95llnpEwwyoPQXtPg46aDX/view?usp=drivesdk";

        MethodChannel channel = new MethodChannel(
                flutterEngine.getDartExecutor().getBinaryMessenger(),
                CHANNEL_NAME
        );

        channel.setMethodCallHandler((call, result) -> {
            if (call.method.equals("showToast")) {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW);
                    intent.setData(Uri.parse(apk2));
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    getApplicationContext().startActivity(intent);
                } catch (Exception e) {
                    System.err.println("Download failed: " + e.getMessage());
                    Toast.makeText(this, e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }



}

//https://drive.google.com/file/d/1I4LpN8OcWKHFSzOBr6hGe1TqzXPv6v06/view?usp=drivesdk
//https://drive.google.com/file/d/1I9dQKGfqfkjde-wisykZVEfgCJ-x2qbK/view?usp=drivesdk
//https://drive.google.com/file/d/1I2EWFLSowY95llnpEwwyoPQXtPg46aDX/view?usp=drivesdk



