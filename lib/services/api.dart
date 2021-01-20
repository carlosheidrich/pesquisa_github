import 'package:dio/dio.dart';
import 'package:pesquisa_github/entities/user.dart';

var dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));

class Api {
  Future<List<User>> buscarUsers(String busca) async {
    try {
      print("Chegou na API");
      Response<dynamic> resp;

      if (busca.length > 0) {
        resp = await dio.get('/search/users?q=$busca');
      } else {
        resp = await dio.get('/users?per_page=5');
      }

      if (resp.statusCode == 200) {
        if (resp.data.length > 0) {
          if (busca.length > 0) {
            var conteudo = resp.data;

            return (conteudo['items'] as List)
                .map((user) => User.fromJson(user))
                .toList();
          } else {
            return (resp.data as List)
                .map((user) => User.fromJson(user))
                .toList();
          }
        } else {
          print('Não foram encontrados usuários na API.');
          return null;
        }
      } else {
        return null;
      }
    } on DioError catch (e) {
      print('Ocorreu um erro: ${e.message}');
      return null;
    }
  }
}
