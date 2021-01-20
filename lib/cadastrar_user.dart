import 'package:e_mall/login.dart';
import 'package:e_mall/provider/provider.dart';
import 'package:e_mall/usuarios/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CadastrarUser extends StatefulWidget{
  _CadastrarUserNew createState()=> _CadastrarUserNew();
}

class _CadastrarUserNew extends State<CadastrarUser>{
 final Map<String, String> _formData = {};
 final _form = GlobalKey<FormState>();
 bool mostraSenha = true;
 bool mostraSenha2 = true;
 final visibilidadeTrue = Icons.visibility;
 final visibilidadeFalse = Icons.visibility_off_outlined;
 
_save(){
  final valida = _form.currentState.validate();
  if(valida){
   _form.currentState.save();
   if(_formData['senha'] != _formData['confirSenha']){
     return;
   }else{

  Provider.of<LojaProvider>(context, listen: false).save(User(
    id: _formData['id'],
    nome: _formData['nome'],
    cpf: _formData['cpf'],
    email: _formData['email'],
    userName: _formData['userName'],
    senha: _formData['senha'],


  ));
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Login()));
   }
    }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          
        elevation: 20,  actions: <Widget>[
        IconButton(icon: Icon(Icons.save), onPressed: (){
          _save();

        })
      ],),
      body: Form(
        key: _form,
        child: Container(
        padding: EdgeInsets.all(12),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 45),
              
              child: Row(children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(Icons.person_add_alt_1_rounded, size: 50 ,color: Colors.black,),
            ),
               Text('Cadastro', style: TextStyle(fontSize: 50,
            fontFamily: 'Alata'),) ],)),
          TextFormField(
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Nome não pode ser em branco!';
              }
              if(value.toString().length < 3){
                return 'Insira um nome válido';
              }
              return null;
            },
            onSaved: (value)=>_formData['nome']=value,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Informe seu nome',
              labelText: 'Nome completo',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            

            ),
          ),
          TextFormField(
            onSaved: (value)=>_formData['nome']=value,
              validator: (value){
              if(value == null || value.isEmpty){
                return 'CPF não pode ser em branco!';
              }
              if(value.toString().length < 3){
                return 'Insira um CPF válido';
              }
              return null;
            },
          keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '000.000.000-00',
              labelText: 'CPF',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            )

          ),
          TextFormField(
            onSaved: (value)=>_formData['email']=value,
             validator: (value){
              if(value == null || value.isEmpty){
                return 'Email não pode ser em branco!';
              }
              if(value.toString().length < 3){
                return 'Insira um email válido';
              }
              return null;
            },

             keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'exemple2021@gmail.com',
              labelText: 'E-Mail',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            )
          ),
          
          TextFormField(
            onSaved: (value)=>_formData['userName']=value,
             validator: (value){
              if(value == null || value.isEmpty){
                return 'Nome de usuário não pode ser em branco!';
              }
              if(value.toString().length < 3){
                return 'Insira um nome de usuário que contenha no mínimo 4 caracteres';
              }
              return null;
            },

             keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.person_add_alt_1_rounded),
              hintText: 'Escolha um nome de usuário.' 
              'Ex.: userName21..',
              labelText: 'Nome de usuário',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            )
          ),
          TextFormField(
            onSaved: (value)=>_formData['senha']=value,
             validator: (value){
              if(value == null || value.isEmpty){
                return 'Senha não pode ser em branco!';
              }
              if(value.toString().length < 6){
                return 'Insira uma senha que contenha mais de 6 caracteres';
              }
              return null;
            },

            obscureText: mostraSenha,
            
            decoration: InputDecoration(
              icon: IconButton(icon: Icon(Icons.visibility_off),  onPressed:(){
                setState(() {
                  mostraSenha == true? mostraSenha = false: mostraSenha = true;
                } );
               } ,),
              hintText: 'Escolha uma senha',
              labelText: 'Senha ',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            )
          ),
           TextFormField(
            onSaved: (value)=>_formData['confirSenha']=value,
             validator: (value){
              if(value == null || value.isEmpty){
                return 'Senha não pode ser em branco!';
              }
              if(value.toString().length < 6){
                return 'Insira uma senha que contenha mais 6 caracteres';
              }
              return null;
            },

             obscureText: mostraSenha2,
            decoration: InputDecoration(
              
              icon: IconButton(icon: Icon(visibilidadeFalse),
               onPressed:(){
                setState(() {
                  mostraSenha2 == true? mostraSenha2 = false: mostraSenha2 = true;
                } );
               }),
              hintText: 'Confirme a sua senha',
              labelText: 'Confirmar senha',
              focusColor: Colors.black,
              fillColor: Colors.purple,
              contentPadding: EdgeInsets.all(9),
            )
          ),




        ],),


      ),
    )
    );
  }

}