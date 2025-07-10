import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Torch(),
    );
  }
}

class Torch extends StatefulWidget {
  @override
  State<Torch> createState() => _TorchState();
}

class _TorchState extends State<Torch> {
  bool istorchon = false;

  Future<void> flashlight() async {
    if (istorchon) {
      await TorchLight.disableTorch();
    } else {
      await TorchLight.enableTorch();
    }
    setState(() {
      istorchon = !istorchon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff262626),
      appBar: AppBar(
        title: Text(
          'Flash Light',
          style: TextStyle(
              color: Color(0xff11d67a),
              fontWeight: FontWeight.w800,
              fontSize: 40,
              fontFamily: 'MainFont'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1E1E1E),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xff262626),
                  border: Border.all(
                      width: 8,
                      color: istorchon ? Color(0xff11d67a) : Colors.grey),
                  borderRadius: BorderRadius.circular(120),
                  boxShadow: [
                    BoxShadow(
                        color:
                            istorchon ? Color(0xff11d67a) : Colors.transparent,
                        blurRadius: 7)
                  ]),
            ),
            ElevatedButton(
              onPressed: () {
                flashlight();
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), // Makes it circular
                padding: EdgeInsets.all(34), // Adjust size
                backgroundColor: Colors.black, // Button color
              ),
              child: Icon(
                Icons.power_settings_new,
                size: 40,
                color: istorchon ? Color(0xff11d67a) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
