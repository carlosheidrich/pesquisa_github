import 'package:flutter/material.dart';
import 'package:pesquisa_github/entities/user.dart';

class Detalhe extends StatefulWidget {
  final User user;

  const Detalhe({this.user});

  @override
  _DetalheState createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe> {
  final _formKey = GlobalKey<FormState>();
  final _scafoldKey = GlobalKey<ScaffoldState>();
  final String initialValue = '';
  User user;

  @override
  void initState() {
    super.initState();

    user = widget?.user ?? User();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text(
          'Detalhes do Usuário',
          textAlign: TextAlign.center,
        ),
      ),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 95,
                child: Hero(
                  tag: user?.id?.toString() ?? '',
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      user?.avatarUrl ?? null,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'ID: ${user.id}',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                'Login: ${user.login}',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                'Repositório: ${user.htmlUrl}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Tipo: ${user.type}',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                'Admin: ${user.siteAdmin}',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                'Score: ${user.score}',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
