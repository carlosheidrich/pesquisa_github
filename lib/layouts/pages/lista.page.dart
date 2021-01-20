import 'package:flutter/material.dart';
import 'package:pesquisa_github/controllers/controller.dart';
import 'package:pesquisa_github/entities/user.dart';
import 'package:pesquisa_github/layouts/pages/detalhe.page.dart';

class Lista extends StatefulWidget {
  Lista({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  var users = <User>[];
  Future<List<User>> getUsers;
  var _buscaController = TextEditingController();

  void _buscaUsers() async {
    var appController = AppController();
    var u1 = User.fromJson({
      "id": 74748328,
      "login": "carlosheidrich",
      "node_id": "MDQ6VXNlcjc0NzQ4MzI4",
      "avatar_url": "https://avatars2.githubusercontent.com/u/74748328?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/carlosheidrich",
      "html_url": "https://github.com/carlosheidrich",
      "followers_url": "https://api.github.com/users/carlosheidrich/followers",
      "following_url":
          "https://api.github.com/users/carlosheidrich/following{/other_user}",
      "gists_url":
          "https://api.github.com/users/carlosheidrich/gists{/gist_id}",
      "starred_url":
          "https://api.github.com/users/carlosheidrich/starred{/owner}{/repo}",
      "subscriptions_url":
          "https://api.github.com/users/carlosheidrich/subscriptions",
      "organizations_url": "https://api.github.com/users/carlosheidrich/orgs",
      "repos_url": "https://api.github.com/users/carlosheidrich/repos",
      "events_url":
          "https://api.github.com/users/carlosheidrich/events{/privacy}",
      "received_events_url":
          "https://api.github.com/users/carlosheidrich/received_events",
      "type": "User",
      "site_admin": false,
      "score": 1.0
    });
    //users.clear();
    //users.add(u1);
    //users.add(u1);
    users = await appController.buscaUsers(_buscaController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    //_buscaUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: screen.height / 10 * 1,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: _buscaController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[900],
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 15.0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          hintText: "Digite um nome para pesquisar",
                          hintStyle: TextStyle(
                            fontSize: 19,
                          ),
                          labelText: "Pesquisar",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //focusNode: focus1,
                        onFieldSubmitted: (v) {
                          //FocusScope.of(context).requestFocus(focus2);
                        },
                      ),
                    ),
                  ),
                ),
                FlatButton.icon(
                  padding: EdgeInsets.all(15),
                  icon: Icon(Icons.search),
                  label: Text('Buscar'),
                  onPressed: () async {
                    _buscaUsers();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 20,
            indent: 5,
            endIndent: 5,
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users?.length ?? 0,
              itemBuilder: (_, index) {
                var user = users[index];

                return ListTile(
                  leading: Hero(
                    tag: user.id.toString(),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user?.avatarUrl ?? null),
                    ),
                  ),
                  title: Text(
                    'Login: ${user.login} - ID: ${user.id}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('${user.htmlUrl}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Detalhe(
                          user: user,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
