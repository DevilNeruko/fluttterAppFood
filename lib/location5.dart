// lib/location1.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location5 extends StatefulWidget {
  @override
  _Location5State createState() => _Location5State();
}

class _Location5State extends State<Location5> {
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
        title: Text('ชานมไข่มุก'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/ชานมไข่มุก.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'ชานมไข่มุก',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'ชานมไข่มุก หรือชื่อในภาษาจีนว่า เจินจูไหน่ฉา หรือ ปัวป้าไหน่ฉา เป็นเครื่องดื่มที่คิดค้นในประเทศไต้หวันในช่วงปี 1980 ใส่ลูกกลม ๆ ที่ทำมาจากแป้งมันสำปะหลัง คนส่วนใหญ่นิยมเรียกว่า "ไข่มุก" ',
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
                        'https://www.youtube.com/watch?v=3q710vHJTBw'); // เปลี่ยนลิงก์ตามต้องการ
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
