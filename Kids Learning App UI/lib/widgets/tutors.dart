import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tutors extends StatelessWidget {
  late String image;
  late String name;
  late String course;
  late String pay;

  Tutors({
    super.key,
    required this.image,
    required this.name,
    required this.course,
    required this.pay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: Color(0xffbbfcfb),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 150,
              child: Image(image: AssetImage(image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.baloo2(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    course,
                    style: GoogleFonts.baloo2(
                      fontSize: 13,
                      color: Color(0xff015450),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(pay, style: GoogleFonts.baloo2(fontSize: 17)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
