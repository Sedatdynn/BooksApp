import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> UserLogin(String email, String password) async {
  String url = "http://10.0.2.2:4000/user/login";

  Map body = {"email": email, "password": password};

  var res = await http.Client().post(Uri.parse(url), body: body);

  if (res.statusCode == 200) {
    return true;
  } else {
    return false;
  }
  // token could saved to cookie.
  //SharedPreferences prefs = await SharedPreferences.getInstance();
}
