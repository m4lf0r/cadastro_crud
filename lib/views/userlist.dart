import 'package:cadastro_crud/data/dummy_users.dart';
import 'package:cadastro_crud/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ), //appbar
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    ); //scaffold
  }
}