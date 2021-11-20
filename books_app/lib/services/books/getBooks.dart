import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getFOod({int page = 1, int limit = 10}) async {
  String url = "http://10.0.2.2:4000/book?page=${page}&limit=${limit}";

  var res = await http.Client().get(Uri.parse(url));

  if (res.statusCode == 200) {
    return true;
  } else {
    return false;
  }
  // token could saved to cookie. shoudl create model and return data
  //SharedPreferences prefs = await SharedPreferences.getInstance();
}
