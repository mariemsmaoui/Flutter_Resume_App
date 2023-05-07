import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv/components/course_card.dart';
import 'package:cv/components/associative_life.dart';
import 'package:cv/pages/Languages.dart';
import 'package:cv/screen/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:cv/configs/app_dimensions.dart';
import '../../model/course.dart';
import 'package:cv/components/course_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/skill.dart';

class Skills extends StatelessWidget {

  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Skills",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                      color: Colors.blue.shade200, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: skills
                      .map(
                        (skill) =>
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CourseCard(
                            title: skill.title,
                            iconSrc: skill.iconSrc,
                            color: skill.color,
                          ),
                        ),
                  )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "Languages",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                      color: Colors.blue.shade200, fontWeight: FontWeight.bold),
                ),
              ),
              // Add the Container widget here
               Languages(),


            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}