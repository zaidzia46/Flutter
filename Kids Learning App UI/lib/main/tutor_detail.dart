import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TutorDetail extends StatelessWidget {
  List images = [
    'assets/images/icon1.png',
    'assets/images/icon2.png',
    'assets/images/icon3.png',
  ];

  List days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  var tutor_detail;
  TutorDetail({super.key, required this.tutor_detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(color: Color(0xffa7f7fc)),
              child: Row(
                children: [
                  Image(image: AssetImage(tutor_detail['imageUrl'])),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          tutor_detail['name'],
                          style: GoogleFonts.baloo2(fontSize: 25),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        tutor_detail['subject'],
                        style: GoogleFonts.baloo2(
                          fontSize: 15,
                          color: Color(0xff015450),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xff015450)),
                          Text(tutor_detail['rating']),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.account_box_rounded,
                            color: Color(0xff015450),
                          ),
                          Text(
                            tutor_detail['experience'],
                            style: GoogleFonts.baloo2(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(tutor_detail['detail']),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Courses',
                    style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tutor_detail['courses'].length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color(0xffa7f7fc),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                tutor_detail['courses'][index],
                                style: GoogleFonts.baloo2(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 150,
                                child: Image(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Availability',
                    style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day in days)
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color:
                                  tutor_detail['availableDays'].contains(day)
                                      ? Color(0xffa7f7fc)
                                      : Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff015450),
                  foregroundColor: Colors.white,
                ),
                child: Text('Make an Appointment'),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
