import 'package:e_mall/components/dummy_lojas.dart';
import 'package:e_mall/loja/loja.dart';
import 'package:e_mall/lojaTile.dart';
import 'package:e_mall/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriasTelas extends StatelessWidget{
  final int paramentro;
  CategoriasTelas({this.paramentro});

  
  
  @override
  Widget build(BuildContext context) {
    final loja = Provider.of<LojaProvider>(context);
    return Scaffold(
    appBar: AppBar(
      title: Text('Lojas'),
    ),
        
    body:  InkWell(
      onTap: (){

      },
      child: ListView.builder(
      itemCount: loja.count,
      itemBuilder:(ctx, i)=> LojaTile(loja.byIndex(i))
       ),
      
    
    ));
  }
  

}