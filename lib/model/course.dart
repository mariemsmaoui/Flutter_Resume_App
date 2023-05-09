import 'package:flutter/material.dart' show Color;

class Course {
  final String title, description, iconSrc;
  final Color color;

  Course({
    required this.title,
    this.description = '',
    this.iconSrc = "assets/images/aisec.png",
    this.color = const Color(0xBD033C9A),
  });
}

final List<Course> courses = [
  Course(
    title: "Scrum",
    iconSrc: "assets/images/1.png",
  ),
  Course(
    title: "Hult Prize",
    iconSrc: "assets/images/4.png",
    color: const Color(0xFF9CC5FF),
  ),
  Course(
    title: "CCNA",
    iconSrc: "assets/images/5.png",
    color: const Color(0xBD033C9A),
  ),
  Course(
    title: "Linked In",
    iconSrc: "assets/images/3.png",
    color: const Color(0xFF9CC5FF),
  ),

];

final List<Course> recentCourses = [
  Course(title: "Aisec in Tunisia" ,
    description: "Team leader in aiesec in tunisia",
  ),

 // Course(title: "HackUp ChallengeV2.0 "),
  Course(
    title: "HackUp Challenge",
    description: "participated in compettion: coding",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/images/hackup.png",
  ),
  Course(
    title: "Hult Prize",
    description: "participate din compettion: startup idea",
    color: const Color(0xBD033C9A),
    iconSrc: "assets/images/hult.jpg",
  ),
  Course(
    title: "Hult Prize",
    description: "participated in compettion: coding",
    color: const Color(0xFF9CC5FF),
    iconSrc: "assets/images/xcoding.png",
  ),


];
