import 'package:http/http.dart' as http;

class FetchStore {
  final _url = 'https://rocky-harbor-12898.herokuapp.com';

  Future fetchProductos() async {
    http.Response data = await http.get('$_url/api/store/products/');
    return data.body;
  }

  Future fetchProductoId(int id) async {
    http.Response data = await http.get('$_url/api/store/products/$id');
    return data.body;
  }
}
