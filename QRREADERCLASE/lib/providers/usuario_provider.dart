//Web Api KEY: AIzaSyAANK6GeMhGZYKFHMVCQwQ_Fky3oHmCJAY
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_reader_clase/models/usuario_model.dart';

class UsuarioProvider {
  String _apiKey = 'AIzaSyAANK6GeMhGZYKFHMVCQwQ_Fky3oHmCJAY';
  String _url = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  Future<bool> registrarUsuario(UsuarioModel usuarioModel) async {
    final url = '${_url}signUp?key=$_apiKey';
    final resp = await http.post(url, body: usuarioModelToJson(usuarioModel));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<bool> loginUsuario(UsuarioModel usuarioModel) async {
    final url = '${_url}signInWithPassword?key=$_apiKey';
    final resp = await http.post(url, body: usuarioModelToJson(usuarioModel));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
