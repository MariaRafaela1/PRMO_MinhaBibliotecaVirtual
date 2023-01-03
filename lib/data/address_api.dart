import 'dart:convert';

import 'package:helloworld/domain/address.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddressApi {
  final String _baseUrl = "viacep.com.br";

  findAddressByCep(String cep) async {
    Uri url = Uri.http(_baseUrl, "/ws/$cep/json/");
    Response response = await http.get(url);

   if (response.statusCode == 200) {
       var json = jsonDecode(response.body);
       return Address.fromJson(json);

    } else {
      throw Exception('Error: ${response.statusCode}');
    }
   
  }
}
