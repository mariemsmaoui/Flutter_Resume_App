import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Informations extends StatefulWidget {
  const Informations({Key? key}) : super(key: key);

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:15),
        Container(
          width: 230,
          margin: EdgeInsets.all(37),

          //   color: Colors.blue.shade200,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    title: Text(
                      'Personal Profile',
                      style: TextStyle(
                          color: Colors.blue.shade200,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            'Passionate about data science and web development curious and highly motivated always looking for new opportunities to learn and grow'),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Icon(Icons.phone, color: Colors.blue.shade200),
                            SizedBox(width: 20),
                            Text('28 521 565'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.blue.shade200),
                            SizedBox(width: 20),
                            Text('sm.mariem99@mgail.com'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.blue.shade200),
                            SizedBox(width: 20),
                            Text('Sfax km4'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.blue.shade200),
                            SizedBox(width: 20),
                            Text('18-05-1999'),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconTheme(
                              data: IconThemeData(color: Colors.black),
                              child: GestureDetector(
                                onTap: () {
                                  launch('https://github.com/mariemsmaoui');
                                },
                                child: Image.asset(
                                  'assets/images/github_icon.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            Spacer(),
                            IconTheme(
                              data: IconThemeData(color: Colors.blue),
                              child: GestureDetector(
                                onTap: () {
                                  launch(
                                      'https://www.linkedin.com/in/mariem-smaoui-595201177/');
                                },
                                child: Image.asset(
                                  'assets/images/linkedin.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: Text(
              'informations',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(10, 50),
            ),
          ),

        ),


      ],

    );

  }

}
