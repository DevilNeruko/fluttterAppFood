// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location4 extends StatefulWidget {
  @override
  _Location4State createState() => _Location4State();
}

class _Location4State extends State<Location4> {
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
        title: Text('แกงเผ็ด'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/แกงเผ็ด.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'แกงเผ็ด',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'แกงเผ็ด เป็นหนึ่งในแกงยอดนิยมของคนไทย พริกแกงที่ใช้ทำจากพริกแดงเป็นหลัก (จึงอาจเรียกว่า แกงแดง) โดยมีส่วนผสมของกะทิเป็นหลักในการแกง นิยมแกงกับเนื้อไก่ เนื้อวัว เนื้อหมู เนื้อเป็ดหรือกุ้ง หรือเต้าหู้สำหรับผู้เป็นมังสวิรัติและใส่หน่อไม้ มะเขือเปราะ และใบโหระพา',
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
                        'https://www.youtube.com/watch?v=hKWrYAhAX3o'); // เปลี่ยนลิงก์ตามต้องการ
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
