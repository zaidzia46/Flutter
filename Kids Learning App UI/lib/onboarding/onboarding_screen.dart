import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kids_app/main/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width:
                  MediaQuery.of(context).size.width < 470
                      ? MediaQuery.of(context).size.width
                      : 470,
              child: Image(image: AssetImage(('assets/images/onboarding.png'))),
            ),
            Text(
              'WHERE KIDS LOVE LEARNING',
              style: GoogleFonts.baloo2(fontSize: 20),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 350,
              child: Text(
                'Distant Learning & Home Schooling Made Easy',
                style: GoogleFonts.baloo2(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 330,
              child: Text(
                'Book Filtered Top Rated Professional\nTutors from the comfort\nof your home in just a few clicks',
                style: GoogleFonts.baloo2(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Color(0xff015450),
                    onChanged: (value) async {
                      setState(() {
                        isChecked = value!;
                      });

                      var prefs = await SharedPreferences.getInstance();
                      prefs.setBool('check', isChecked);
                    },
                  ),
                  Text("Don't show again", style: GoogleFonts.nunito()),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: Text('Skip', style: GoogleFonts.nunito()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffa7f7fc),
    );
  }
}
