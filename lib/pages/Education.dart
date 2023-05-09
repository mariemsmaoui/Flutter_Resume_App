import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cv/screen/BottomNavigationBar.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
  final String baseUrl;
  Education({this.baseUrl = 'http://192.168.1.17:8000'});

  //Education({required this.baseUrl});

  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint/'));
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class _EducationState extends State<Education> {
  List<dynamic> educationData = [];
  List<dynamic> experienceData = [];
  List<dynamic> academicProjectsData = [];
  List<dynamic> associativeLifeData = [];

  final apiProvider = Education(baseUrl: 'http://192.168.1.17:8000');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(
    //    color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                ),
                child: Text(
                  "Education",
                  style: GoogleFonts.lato(
                    fontSize: 40,
                    color: Colors.blue.shade300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "2018-2019",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Hbib Themeur School",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Icon(FontAwesomeIcons.graduationCap),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Bacculaurate degree in science",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Color(0xFF6E717E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "2019-2021",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Institute of Multimedia",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: Icon(FontAwesomeIcons.graduationCap),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Software engineering",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Color(0xFF6E717E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),


              Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade900,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "2021-2024",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "International Institute ",
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey
                          ),
                          child: Icon(FontAwesomeIcons.graduationCap),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Software engineering",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Color(0xFF6E717E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBarWidget()


    );
  }
}
