import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(icon: Icon(Icons.menu), onPressed: () => Get.toNamed('/menu')),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: c.setQuery,
            ),
          ),
          Expanded(
            child: Obx((){
              final list = c.filtered;
              return ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: list.length,
                itemBuilder: (context, index){
                  final item = list[index];
                  return GestureDetector(
                    onTap: () => Get.toNamed('/detail', arguments: item),
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical:8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'image_' + (item['id'] ?? 0).toString(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              child: Image.asset(item['image'], width: 120, height: 90, fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width:12),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical:12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'], style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)),
                                  SizedBox(height:6),
                                  Text(item['price'], style: TextStyle(color: Colors.grey[700])),
                                  SizedBox(height:6),
                                  Text(item['desc'], maxLines:2, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              );
            }),
          )
        ],
      ),
    );
  }
}
