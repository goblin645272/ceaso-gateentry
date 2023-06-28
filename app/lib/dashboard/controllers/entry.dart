import 'package:app/dashboard/constants.dart';
import 'package:http/http.dart' as http;

void submitEntry(Object body, String authtoken, Function callback) async {
  Uri url = Uri.parse("$apiUrl/entry/add");

  final response = await http.post(url,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Bearer $authtoken",
      },
      body: body);
  callback(response.statusCode);
}
