import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

Future<bool> UsersignUp(String username, String email, String password) async {
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = "http://10.0.2.2:4000/user/register";
  Map body = {"username": username, "email": email, "password": password};
  print(body);
  var res = await http.Client().post(Uri.parse(url), body: body);

  if (res.statusCode == 200) {
    return true;
  } else {
    print(res.body);
    return false;
  }
}
