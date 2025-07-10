import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_app/main/tutor_detail.dart';

import '../widgets/tutors.dart';
import '../widgets/tutors_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openTutorDetails(int tutorId) {
    final tutor = tutors.firstWhere((t) => t['id'] == tutorId);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TutorDetail(tutor_detail: tutor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffa7f7fc)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              curve: Curves.fastEaseInToSlowEaseOut,
              decoration: BoxDecoration(color: Color(0xffa7f7fc)),
              child: Text(
                'Kids Learning App',
                style: GoogleFonts.baloo2(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Settings')),
            ListTile(title: Text('Glossary')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffa7f7fc),
                image: DecorationImage(
                  image: AssetImage('assets/images/searchBg.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,', style: GoogleFonts.baloo2(fontSize: 20)),
                    Text('John Scott', style: GoogleFonts.baloo2(fontSize: 30)),
                    SizedBox(height: 55),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        cursorColor: Color(0xff015450),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff02a8a0),
                          ),
                          hintText: 'Search for tutors',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    'Top Rated Tutors',
                    style: GoogleFonts.baloo2(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: GoogleFonts.baloo2(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height:
                  MediaQuery.of(context).size.height * 0.5 > 400
                      ? MediaQuery.of(context).size.height * 0.45
                      : MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemCount: tutors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      openTutorDetails(tutors[index]['id']);
                    },
                    child: Tutors(
                      image: tutors[index]['imageUrl'],
                      name: tutors[index]['name'],
                      course: tutors[index]['subject'],
                      pay: tutors[index]['charges'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
