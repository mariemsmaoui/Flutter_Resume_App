import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.title,
    this.color = const Color(0xBD033C9A),
    required this.iconSrc,
  }) : super(key: key);

  final String title, iconSrc;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only( right:5),
              child: Column(
                children: [
                  SizedBox(height: 1),
                  Text(
                    title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 8),
                  ),
                  Spacer(),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 190,
            child: Image.asset(iconSrc),
          ),
        ],
      ),
    );
  }
}
