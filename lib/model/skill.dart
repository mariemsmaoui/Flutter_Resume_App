import 'package:flutter/material.dart' show Color;

class Skill {
  final String title, description, iconSrc;
  final Color color;

  Skill({
    required this.title,
    this.description = '',
    this.iconSrc = "assets/images/aisec.png",
    this.color = const Color(0xBD033C9A),
  });
}

final List<Skill> skills = [
  Skill(
    title: "Flutter",
    iconSrc: "assets/images/flutter.png",
  ),
  Skill(
    title: "Django",
    iconSrc: "assets/images/django.png",
    color: const Color(0xFF9CC5FF),
  ),
  Skill(
    title: "Angular",
    iconSrc: "assets/images/angular.png",
    color: const Color(0xBD033C9A),
  ),
  Skill(
    title: "Adobe xd",
    iconSrc: "assets/images/xd.png",
    color: const Color(0xFF9CC5FF),
  ),
  Skill(
    title: "React Js & Native",
    iconSrc: "assets/images/react.png",
    color: const Color(0xBD033C9A),
  ),
];




