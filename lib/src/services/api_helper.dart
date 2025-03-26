import 'package:http/http.dart' as http;

import '../utils/path_provider.dart';

class Apihelper extends GetxService {
  Future<dynamic> getHeaders() async {
    return {"Content-Type": "application/json", "Accept": "application/json"};
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error : ${response.statusCode} - ${response.body}");
    }
  }

  dynamic _handleError(dynamic error) {
    SnackNotification.error(message: error.toString());
    return Exception("###################\nError :  $error");
  }

  Future<dynamic> getRequest(String url, String endpoint) async {
    print("url : $url\nendpoint:$endpoint");
    print("#-#-#");
    try {
      final response = await http.get(
        Uri.parse('$url$endpoint'),
        headers: await getHeaders(),
      );
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> postRequest(
    String url,
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    print("url : $url\nendpoint:$endpoint");
    print(body);
    print("#-#-#");

    try {
      final response = await http.post(
        Uri.parse('$url$endpoint'),
        body: jsonEncode(body),
        headers: await getHeaders(),
      );
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> putRequest(
    String url,
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$url$endpoint'),
        body: jsonEncode(body),
        headers: await getHeaders(),
      );
      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }
}
