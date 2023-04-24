import 'package:cv/screen/Splash_Animated.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cv/pages/About.dart';

void main() {
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  ResumeApp({super.key});
  final routes = {
    '/about': (context) => About(),

  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Splash_Animated());
  }

}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> _downloadResume() async {
    // Load the pdf asset from the app bundle
    final ByteData data = await rootBundle.load('assets/Mariem_smaoui_Resume.pdf');
    final List<int> bytes = data.buffer.asUint8List();

    // Get the device's application support directory using the path_provider package
    final String dir = (await getApplicationSupportDirectory()).path;

    // Create a new file in the application support directory
    final File file = File('$dir/Mariem_smaoui_Resume.pdf');

    // Write the pdf data to the new file
    await file.writeAsBytes(bytes);

    // Show a message to the user that the download is complete
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Download complete.'),
        duration: const Duration(seconds: 3),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE4EBF6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Click the button to download your resume:',
                    style: TextStyle(fontSize: 16),
                  ),
                  CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('assets/images/me.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _downloadResume,
                        icon: Icon(Icons.download),
                        label: Text(
                          "Resume",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Robototo Condensed',
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                          );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Robototo Condensed',
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue.shade100,

                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.symmetric(horizontal: 27), // add some horizontal padding
                child: Center(
                  child: Text(
                    'software engineering student & business intelligence',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              )

              /*if (downloading)
                SizedBox(
                  height: 20,
                  child: CircularProgressIndicator(),
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}
