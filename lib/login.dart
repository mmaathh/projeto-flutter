
import 'package:e_mall/cadastrar_user.dart';
import 'package:e_mall/main.dart';
import 'package:e_mall/provider/provider.dart';
import 'package:e_mall/usuarios/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  final User users;
  Login({this.users});
_LoginState createState()=> _LoginState();
}

class _LoginState extends State<Login>{
    final Map<String, String> _formData = {};
  final  _form = GlobalKey<FormState>();
  bool valida = false; 
 


 
  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return Scaffold(
      
      body:
       Form(
        key: _form,
        child: Container(
          padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 40),
            child: Text('Login', style: TextStyle(fontFamily: 'Alata', fontSize: 70, color: Colors.black,
            ),),),          
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person_outline, color: Colors.black, size: 40,),
              contentPadding: EdgeInsets.all(8),
              focusColor: Colors.black,
              hintText: 'Informe seu nome de usuário',
              labelText: 'Nome de usuário' ),
              onSaved: (value)=>_formData['userName']= value,
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'insira um usuário válido';
                }
                if(value.trim().length < 3){
                  return 'usuário inválido';
                }
                return null;
              },
            ),

          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.black, size: 40,),
              hintText: 'Informe sua senha',
            
              contentPadding: EdgeInsets.all(8),
            labelText: 'Senha'
            ),
              onSaved: (value)=>_formData['senha']= value,
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'senha ínvalida';
                }
                if(value.trim().length < 3){
                  return 'senha invalida';
                }
                return null;
              },

          ),
          Container(
            margin: EdgeInsets.only(top: 11) ,
            child: Provider.of<LojaProvider>(context).mensagemErro(valida: valida)
          ),

          Center(
            heightFactor: 2,
            

            child: RaisedButton.icon(
              highlightElevation: 10,
              disabledColor: Colors.grey,
              onPressed: (){
                

                try {
                  final valida = _form.currentState.validate();
                  if(valida){

                    _form.currentState.save();
                   


                  Provider.of<LojaProvider>(context, listen: false).autentifica(User(
                  userName: _formData['userName'],
                  senha: _formData['senha']
                ), context, valida);
                   
               }
             
                } catch (e) {
                  throw new Error();
                }
                 
                
                }, 
              
              padding: EdgeInsets.only(left: 160, right: 160),
              focusColor: Colors.red,
              color: Colors.blue,
              disabledElevation: 1,
              elevation: 10,
              icon: Icon(Icons.account_circle_sharp), 
              label: Text('Entrar'))
        ),
        Center(
          
          child: RaisedButton.icon(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CadastrarUser()));
            }, 
            highlightElevation: 10,
            disabledColor: Colors.grey,
            icon: Icon(Icons.person_add), 
            label: Text('Cadastre-se'),
              padding: EdgeInsets.only(left: 140, right: 140),
              focusColor: Colors.red,
              color: Colors.blue,
              disabledElevation: 1,
              elevation: 10,
            )
            ),
            
        
        ],
        
        )
        ,
        ),
        
    )
  
    );
  }

}
