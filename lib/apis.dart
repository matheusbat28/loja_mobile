import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getProducts(String search) async {
  var url = Uri.parse('https://dummyjson.com/products/search?q=${search}');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Erro na solicitação: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> getCategories() async {
  var url = Uri.parse('https://dummyjson.com/products/categories');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    var data = jsonDecode(response.body);
    return {'categories': data};
  } else {
    throw Exception('Erro na solicitação: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> getProduct(int id) async {
  var url = Uri.parse('https://dummyjson.com/products/$id');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    var data = jsonDecode(response.body);
    return {'products': data};
  } else {
    throw Exception('Erro na solicitação: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> getProductInCategory(String category) async {
  var url = Uri.parse('https://dummyjson.com/products/category/$category');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    var data = jsonDecode(response.body);
    return {'category': data};
  } else {
    throw Exception('Erro na solicitação: ${response.statusCode}');
  }
}
