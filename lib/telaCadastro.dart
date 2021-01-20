import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro'),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 358,
          alignment: Alignment.bottomCenter,
          child: NavegaUsuario(),
      ),
      Container(
          padding: EdgeInsets.all(10),
          height: 358,
          alignment: Alignment.topCenter,
          child: NavegaLoja(),          
      )
      
      
      ],)
    );
  }

}


class NavegaLoja extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){},
      child: 
      Container(
        
        padding: EdgeInsets.all(8),
        color: Colors.grey[500],
        child: ListTile(
          leading: Icon(Icons.store, color: Colors.black  ,),
          title: Text('Loja', style: Theme.of(context).textTheme.headline1,),
          subtitle: Text('Deseja cadastrar como loja?', style: TextStyle(fontSize: 18),),
        ),) ,
    );
  }

}

class NavegaUsuario extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){},
      child: 
      Container(
        
        padding: EdgeInsets.all(8),
        color: Colors.grey[500],
        child: ListTile(
          leading: Icon(Icons.person_add, color: Colors.black,),
           title: Text('Usuário', style: Theme.of(context).textTheme.headline1,),
          subtitle: Text('Deseja cadastrar como usuário?', style: TextStyle(fontSize: 18),),
        ),) ,
    );
  }

}