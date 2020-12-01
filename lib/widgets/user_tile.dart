import 'package:cadastro_crud/models/user.dart';
import 'package:flutter/material.dart';

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
    );
  }
}