import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Get.arguments as Map<String,dynamic>? ?? {};
    return Scaffold(
      appBar: AppBar(title: Text(item['title'] ?? 'Detail')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'image_' + (item['id'] ?? 0).toString(),
              child: Image.asset(item['image'] ?? 'assets/images/placeholder1.png', width: double.infinity, height: 220, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'] ?? '', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
                  SizedBox(height:8),
                  Text(item['price'] ?? '', style: TextStyle(color: Colors.indigo)),
                  SizedBox(height:12),
                  Text(item['desc'] ?? '', style: TextStyle(fontSize:16)),
                  SizedBox(height:20),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text('Contact Owner')
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
