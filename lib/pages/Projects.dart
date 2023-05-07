import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv/components/course_card.dart';
import 'package:cv/components/associative_life.dart';
import 'package:cv/screen/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:cv/configs/app_dimensions.dart';
import '../../model/course.dart';
import 'package:cv/components/course_card.dart';

import 'Skills.dart';

class Projects extends StatelessWidget {

  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Certficates",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.blue.shade200, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map(
                        (course) => Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CourseCard(
                        title: course.title,
                     iconSrc: course.iconSrc,
                        color: course.color,
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "Associative Life",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.blue.shade200, fontWeight: FontWeight.bold),
                ),
              ),
              ...recentCourses
                  .map((course) => Padding(
                padding: const EdgeInsets.only(top: 10,
                    left: 20, right: 20, bottom: 20),
                child: SecondCard(
                  title: course.title,
                  description: course.description,

                  iconsSrc: course.iconSrc,

                  colorl: course.color,
                ),
              ))
                  .toList(),
              // add the Skills widget here

            ],
          ),

        ),
      ),

        bottomNavigationBar: BottomNavigationBarWidget()

    );
  }
}