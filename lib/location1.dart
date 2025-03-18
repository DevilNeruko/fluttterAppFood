// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location1 extends StatefulWidget {
  @override
  _Location1State createState() => _Location1State();
}

class _Location1State extends State<Location1> {
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
        title: Text('ข้าวซอย'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/ข้าวซอย.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'ข้าวซอย',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'ข้าวซอย คืออาหารพื้นเมืองทางภาคเหนือของประเทศไทย เดิมเรียกว่า "ก๋วยเตี๋ยวฮ่อ" เป็นอาหารที่ได้รับอิทธิพลมาจากชาวจีนยูนนานหรือฮ่อ มีลักษณะคล้ายเส้นบะหมี่ ในน้ำซุปที่ใส่เครื่องแกง รสจัดจ้าน มีเครื่องเคียง ได้แก่ ผักกาดดอง หอมหัวแดง ยำกะหล่ำปลีและมีเครื่องปรุงรส เช่น พริกผัดน้ำมัน น้ำมะนาว น้ำปลา น้ำตาล ในตำรับดั้งเดิมเนื้อที่ใช้เป็นเนื้อไก่หรือเนื้อวัว แต่ในปัจจุบันร้านอาหารหลายแห่งได้มีการใช้เนื้อหมูแทน บางแห่งอาจเพิ่มอาหารทะเลหรือเต้าหู้เป็นส่วนประกอบ',
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
                        'https://www.youtube.com/watch?v=96opC3PHN8o'); // เปลี่ยนลิงก์ตามต้องการ
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
