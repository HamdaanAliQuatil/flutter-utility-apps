import 'package:http/http.dart' as http;

class HttpHelper{
  //https://api.openweathermap.org/data/2.5/weather?q=Delhi&appid=757412f8d711817ed1c5d0bd03bfb924
  final String authority = 'api.openweather.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '757412f8d711817ed1c5d0bd03bfb924';

  Future<String> getWeather(String location) async{
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}