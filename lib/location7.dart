// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location7 extends StatefulWidget {
  @override
  _Location7State createState() => _Location7State();
}

class _Location7State extends State<Location7> {
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
        title: Text('เฟรนช์ฟรายส์'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/เฟรนช์ฟรายส์.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'เฟรนช์ฟรายส์',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'เฟรนช์ฟรายส์ (อังกฤษ: French fries) หรือ ฟรายส์ (fries, ภาษาอังกฤษแบบอเมริกาเหนือ), ชิปส์ (chips, ภาษาอังกฤษแบบบริติชและแบบไอริช), ฟิงเกอร์ชิปส์ (finger chips, ภาษาอังกฤษแบบอินเดีย) เป็นมันฝรั่งหั่นแท่งทอดในน้ำมันท่วมแบบกรอบหรือนุ่มด้านใน โรยเกลือแล้วเสิร์ฟขณะร้อน เฟรนช์ฟรายส์เป็นขนมขบเคี้ยวหรืออาหารจานด่วนที่ทานกับซอสมะเขือเทศ มายองเนส น้ำส้มสายชู หรือซอสบาร์บีคิว นอกจากนี้ยังทานกับเนยแข็ง ซอสทาร์ทาร์ หรือน้ำสลัดเทาซันด์ไอแลนด์ รูปแบบเฟรนช์ฟรายส์มีหลากหลาย เช่น แบบวง แบบหยัก หรือใช้มันเทศแทนมันฝรั่ง',
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
                        'https://www.youtube.com/watch?v=CviwWu6fCmU'); // เปลี่ยนลิงก์ตามต้องการ
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
