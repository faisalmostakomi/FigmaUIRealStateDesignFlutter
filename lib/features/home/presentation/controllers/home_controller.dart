import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
  final RxString query = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // dummy data
    items.addAll(List.generate(8, (index) => {
      'id': index,
      'title': 'Apartment ${index+1}',
      'price': '\$${(index+1)*120} / month',
      'image': 'assets/images/placeholder${index%2+1}.png',
      'desc': 'A nice apartment number ${index+1} in a convenient location.'
    }));
  }

  List<Map<String,dynamic>> get filtered {
    if (query.value.trim().isEmpty) return items;
    return items.where((e) => e['title'].toLowerCase().contains(query.value.toLowerCase())).toList();
  }

  void setQuery(String q) {
    query.value = q;
  }
}
