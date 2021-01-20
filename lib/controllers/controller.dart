import 'package:pesquisa_github/entities/user.dart';
import 'package:pesquisa_github/services/api.dart';

class AppController {
  static User user;

  AppController();

  Future<List<User>> buscaUsers(String busca) async {
    var api = Api();
    return await api.buscarUsers(busca);
  }
}
