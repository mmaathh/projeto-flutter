import 'package:e_mall/cadastrar_user.dart';
import 'package:e_mall/categoriasTelas.dart';
import 'package:e_mall/categorias_grid.dart';
import 'package:e_mall/login.dart';
import 'package:e_mall/loja/loja.dart';
import 'package:e_mall/provider/provider.dart';
import 'package:e_mall/rodape.dart';
import 'package:e_mall/telaCadastro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lojaList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

    providers: [
      ChangeNotifierProvider(create: (ctx)=> LojaProvider()
       )
    ],   
    
    child: MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20,
          fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(fontSize: 20,
          fontFamily: 'Alata', fontWeight: FontWeight.bold, color: Colors.white),
        ),
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CadastrarUser(),
    )
    );
  }
}


class Inicio extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        toolbarHeight: 70,
        
        actions: <Widget>[
          IconButton(icon: Icon(Icons.construction_rounded), onPressed: (){
          
          },)
        ],
        title: Text('Olá, USER!'),
        leading: Icon(Icons.person),
      
     
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
       
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8) ,
            child: Rodape(),
          ),
            Container(
            
           padding: EdgeInsets.all(8),
           alignment: Alignment.bottomCenter,
           height: 160,
           
           decoration: BoxDecoration(
            
             image: DecorationImage(
               image: AssetImage("utilidades/assets/imagens/comida.jpg"),
               fit: BoxFit.fill),
           ),
           child: InkWell(
          
          onTap: (){
          
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CategoriasTelas(
                paramentro: 3,
            )));
           
          },
          child: Text('Comida', style: Theme.of(context).textTheme.headline1,),
         )
         ),  Container(
           padding: EdgeInsets.all(8),
           alignment: Alignment.bottomCenter,
           height: 160,
           decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage("utilidades/assets/imagens/esportes.jpg"),
               fit: BoxFit.fill),
           ),
           child: InkWell(
          
          onTap: (){},
          child: Text('Esportes', style: Theme.of(context).textTheme.headline1,),
         )
         ),
           Container(
           padding: EdgeInsets.all(8),
           alignment: Alignment.bottomCenter,
           height: 160,
           decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage("utilidades/assets/imagens/celulares.jpg"),
               fit: BoxFit.fill),
           ),
           child: InkWell(
          
          onTap: (){},
          child: Text('Celulares', style: Theme.of(context).textTheme.headline1,),
         )
         ),
           Container(
           padding: EdgeInsets.all(8),
           alignment: Alignment.bottomCenter,
           height: 160,
           decoration: BoxDecoration(
             
             image: DecorationImage(
               image: AssetImage("utilidades/assets/imagens/eletrodomesticos.jpg"),
               fit: BoxFit.fill),
           ),
           child: InkWell(
          
          onTap: (){},
          child: Text('Eletrodomesticos', style: Theme.of(context).textTheme.headline1,),
         )
         ),
        
      

      ],));
  }

}