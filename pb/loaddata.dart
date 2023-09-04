import 'package:pocketbase/pocketbase.dart';
import 'package:ubuapp/mockup/data.dart';

void main() {
  loaddata();
}

void loaddata() async {
  final pb = PocketBase('http://127.0.0.1:8090');

// example create body
  

  for (int i = 0; i < 99; i++) {
    List<dynamic> course = randomCourse();
    final body = <String, dynamic>{
      "courseid": course[0],
      "title": course[1],
      "lecturer": course[2]
    };
    await pb.collection('courses').create(body: body);
  }
}
