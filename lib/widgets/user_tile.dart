import 'package:cadastro_crud/models/user.dart';
import 'package:cadastro_crud/provider/users.dart';
import 'package:cadastro_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget{

  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    var avatar;
    if (user.avatarUrl == null || user.avatarUrl.isEmpty) {
      avatar = CircleAvatar(child: Icon(Icons.person));
    } else {
      avatar = CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    }
    return ListTile( 
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
      width: 100,
      child: Row(
        children: <Widget>[
            IconButton(
            icon: Icon(Icons.edit), 
            color: Colors.orange, 
            onPressed: () {
              Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
            },
            ),
            IconButton(
            icon: Icon(Icons.delete),  
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir usuário'),
                  content: Text('Tem certeza que deseja excluir?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confimed) {
                  if(confimed) {
                    Provider.of<Users>(context, listen: false).remove(user);
                  }
                  },
                );
              },
            ),
         ],
        ),
      ),
    );
  }
}