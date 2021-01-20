import 'package:e_mall/categoriasTelas.dart';
import 'package:e_mall/telaCadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rodape extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Row(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home , size:40 , color: Colors.purple,)
          , onPressed: (){},
          ),
            IconButton(
            icon: Icon(Icons.search , size:40 , color: Colors.purple,)
          , onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CategoriasTelas()));
          },
          ),
            IconButton(
            icon: Icon(Icons.shopping_cart, size:40 , color: Colors.purple,)
          , onPressed: (){},
          ),
            IconButton(
            icon: Icon(Icons.person_add_alt_1_outlined, size:40 , color: Colors.purple,)
          , onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Cadastro()));
          },
          ),
           IconButton(
            icon: Icon(Icons.settings, size:40 , color: Colors.purple,)
          , onPressed: (){},
          ),
        ],
      );
      
  }

}