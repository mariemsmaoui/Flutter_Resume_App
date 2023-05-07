
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cv/pages/Education.dart';
import 'package:cv/core/theme/cubit/theme_cubit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv/core/providers/scroll_provider.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constaints.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    // theme
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade900,
              Colors.white,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // your code here

              children: [
                Container(margin: EdgeInsets.only(bottom: 100),
                child: ListTile(
                  leading: Icon(
                    state.isDarkThemeOn
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode,
                    color: state.isDarkThemeOn ? Colors.black : Colors.white, // Set text color to white in dark mode, black in light mode

                    // color: Colors.white, // Set icon color to white
                  ),
                  title: Text(
                    state.isDarkThemeOn ? "Dark Mode" : "Light Mode",
                    style: TextStyle(
                      color: state.isDarkThemeOn ? Colors.black : Colors.white, // Set text color to white in dark mode, black in light mode
                      fontSize: 20,
                    ),
                  ),
                  trailing: Switch(
                    value: state.isDarkThemeOn,
                    activeColor: theme.primaryColor,
                    inactiveTrackColor: Colors.grey,
                    onChanged: (newValue) {
                      context.read<ThemeCubit>().updateTheme(newValue);
                    },
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35, bottom: 61),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 30,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 110,
                          backgroundImage: AssetImage('assets/images/me.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: 320,
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.download),
                              onPressed: () => openURL(
                                  'https://drive.google.com/file/d/1IKYv9JJ71CzxkEI7dzFSSLk3rBAZy7kK/view'),
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Education(),
                              ),
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
                            primary: Colors.blue.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: TypewriterAnimatedTextKit(
                    text: [
                      'Mariem Smaoui',
                      'Software Engineering & Businees Intelligence Student'
                    ],
                    textStyle: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.normal ,color: Colors.indigo.shade900),

                    textAlign: TextAlign.center,
                    speed: Duration(milliseconds: 200),
                    repeatForever: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
