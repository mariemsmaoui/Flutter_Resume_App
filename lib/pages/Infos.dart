
import 'dart:convert';
import 'package:cv/pages/Informations.dart';
import 'package:cv/screen/BottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'Skills.dart';

class Infos extends StatefulWidget {

  @override
  State<Infos> createState() => _InfosState();

  final String baseUrl;
  Infos({this.baseUrl = 'http://192.168.1.17:8000'});

  //About({required this.baseUrl});

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

class _InfosState extends State<Infos> {
  List<dynamic> experienceData = [];


  final apiProvider = Infos(baseUrl: 'http://192.168.1.17:8000');

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    try {
      print('fetchAllData() called'); // add this line

      experienceData = (await apiProvider.fetchData('experience')) as List;
      print('experienceData'); // add this line

      setState(() {});
      print('education.educationData');
    } catch (e) {
      print('Error fetching experience data: ${e.toString()}');
      // print(e.stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child:
            experienceData.isEmpty

            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: experienceData.length,
                  itemBuilder: (BuildContext context, index) {
                    final item = experienceData[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        elevation: 4.0,
                        child: Card(
                         color:const Color(0xFFA8CDFD),
                          child: ListTile(

                            title: Text(
                              experienceData[index]['title'],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              experienceData[index]['desciption'],
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xBD033C9A),
                              ),
                            ),
                            leading: Icon(
                              Icons.circle,
                              color: Colors.blue.shade900,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // handle onTap event for the item
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

           // SizedBox(height: 5),
// infos button
          Informations()
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBarWidget()

    );
  }
}

