import 'package:http/http.dart' as http;

class FetchStore {
  final _url = 'http://api-deliver-web.mya-app.tech';

  Future fetchProductos() async {
    http.Response data = await http.get('$_url/api/store/products/');
    return data.body;
  }
}
