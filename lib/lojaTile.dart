import 'package:e_mall/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loja/loja.dart';

class LojaTile extends StatelessWidget{
  final Loja loja;
  LojaTile(this.loja);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
    onTap: (){},
    child: ListTile(
      leading: Icon(Icons.person),
      title: Text(loja.nome),
      subtitle: Text(loja.nameUser),
    )
    );
  }

}