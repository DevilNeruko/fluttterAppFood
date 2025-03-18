// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location3 extends StatefulWidget {
  @override
  _Location3State createState() => _Location3State();
}

class _Location3State extends State<Location3> {
  int likes = 0;
  int dislikes = 0;

  // ฟังก์ชันเปิด URL
  void _launchURL(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'ไม่สามารถเปิดลิงก์ได้: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ก๋วยเตี๋ยว'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/ก๋วยเตี๋ยว.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'ก๋วยเตี๋ยว',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'ก๋วยเตี๋ยว เป็นหนึ่งใน อาหารประเภทเส้น ที่มีต้นกำเนิดจากประเทศจีน ทำจากแป้งข้าวเจ้า โดยมากจะลวกให้สุกในน้ำเดือด สะเด็ดน้ำ แล้วนำมาใส่เครื่องปรุงชนิดต่าง ๆ นิยมรับประทานทั้งแบบน้ำและแบบแห้ง นิยมใช้ตะเกียบเป็นเครื่องมือในการรับประทาน',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // ปุ่ม Google Maps และดูวิดีโอ
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // ใส่ลิงก์วิดีโอ
                    _launchURL(
                        'https://www.youtube.com/watch?v=A_iDJbTAQEY'); // เปลี่ยนลิงก์ตามต้องการ
                  },
                  child: Text('ดูวิดีโอ'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // ไอคอนกดไลค์และดิสไลค์
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                ),
                Text('$likes'),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.thumb_down),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      dislikes++;
                    });
                  },
                ),
                Text('$dislikes'),
              ],
            ),
            Spacer(),
            // ปุ่มกลับไปหน้าแรก
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('กลับไปหน้าแรก'),
            ),
          ],
        ),
      ),
    );
  }
}
