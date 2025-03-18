// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location6 extends StatefulWidget {
  @override
  _Location6State createState() => _Location6State();
}

class _Location6State extends State<Location6> {
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
        title: Text('บราวนี่'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/บราวนี่.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'บราวนี่',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'บราวนี่ (อังกฤษ: chocolate brownie) มีลักษณะแบนแบบสี่เหลี่ยมหรือบาร์ที่ถูกนำไปอบเริ่มพัฒนาขึ้นครั้งแรกในสหรัฐอเมริกาตอนปลายคริสต์ศตวรรษที่ 19 และเป็นที่ชื่นชอบทั้งในสหรัฐและแคนาดา ในช่วงครึ่งแรกของคริสต์ศตวรรษที่ 20 บราวนีเป็นลูกครึ่งระหว่างเค้กกับคุกกี้ บราวนีถูกผลิตมาในรูปแบบต่าง ๆ บางครั้งก็มีเนื้อเนียนหนึบหรือเป็นเนื้อเค้กขึ้นอยู่กับความเข้มข้นและอาจจะมีส่วนผสมของถั่วชนิดต่าง ๆ, เคลือบน้ำตาล, วิปครีม, ช็อกโกแลตชิป, หรือส่วนผสมอื่น ๆ อาจจะมีการเปลี่ยนรูปแบบการทำเช่น ใช้น้ำตาลแดงและไม่ใส่ช็อกโกแลต โดยจะเรียกว่าบลอนดี',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // ใส่ลิงก์วิดีโอ
                    _launchURL(
                        'https://www.youtube.com/watch?v=QzXTNxuzVjg'); // เปลี่ยนลิงก์ตามต้องการ
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
