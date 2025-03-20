import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location1.dart';
import 'location2.dart';
import 'location3.dart';
import 'location4.dart';
import 'location5.dart';
import 'location6.dart';
import 'location7.dart';
//ยศกรคั้บ

void main() {
  runApp(TouristApp());
}

class TouristApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปของกินและของว่างที่ชอบ ของข้า',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/location1': (context) => Location1(),
        '/location2': (context) => Location2(),
        '/location3': (context) => Location3(),
        '/location4': (context) => Location4(),
        '/location5': (context) => Location5(),
        '/location6': (context) => Location6(),
        '/location7': (context) => Location7(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> locations = [
    {
      'name': 'ข้าวซอย',
      'image': 'assets/images/ข้าวซอย.jpg',
      'route': '/location1',
    },
    {
      'name': 'ข้าวผัด',
      'image': 'assets/images/ข้าวผัด.jpg',
      'route': '/location2',
    },
    {
      'name': 'ก๋วยเตี๋ยว',
      'image': 'assets/images/ก๋วยเตี๋ยว.jpg',
      'route': '/location3',
    },
    {
      'name': 'แกงเผ็ด',
      'image': 'assets/images/แกงเผ็ด.jpg',
      'route': '/location4',
    },
    {
      'name': 'ชานมไข่มุก',
      'image': 'assets/images/ชานมไข่มุก.jpg',
      'route': '/location5',
    },
    {
      'name': 'บราวนี่',
      'image': 'assets/images/บราวนี่.jpg',
      'route': '/location6',
    },
    {
      'name': 'เฟรนช์ฟรายส์',
      'image': 'assets/images/เฟรนช์ฟรายส์.jpg',
      'route': '/location7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ของกินและของว่างที่ชอบ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: locations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, location['route']!);
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.asset(
                                location['image']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              location['name']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
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

Widget snackItem(String name, String imagePath, String videoUrl,
    String description, BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final Uri uri = Uri.parse(videoUrl);

      // ใช้ canLaunchUrl แทน canLaunch
      if (await canLaunchUrl(uri)) {
        // ใช้ launchUrl แทน launch
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถเปิดลิงก์ได้')),
        );
      }
    },
    child: Column(
      children: [
        Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
