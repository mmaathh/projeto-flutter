import 'package:e_mall/components/dummy_lojas.dart';
import 'package:e_mall/components/dummy_user.dart';
import 'package:e_mall/loja/loja.dart';
import 'package:e_mall/usuarios/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LojaProvider with ChangeNotifier {
    final Map<String, Loja>  _loja = {...DUMMY_LOJAS};
    final Map<String, User> _users = {...DUMMY_USERS};
    
  List<Loja> get all{
    return [..._loja.values];
  }

  int get count{
    return _loja.length;

  }
  Loja byIndex(int i){
    return _loja.values.elementAt(i);
  }

  User byIndexOf(int i){
    final user = _users.values.elementAt(i);
    return user;
  }

 autentifica(User user, BuildContext context, bool valida){
  for(var z in _users.values ){
    if(z.userName == user.userName && z.senha == user.senha) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Inicio()));
    }else{
    return valida = true;
    }
  }
 notifyListeners();


}

  mensagemErro({bool valida}){ 
print(valida);
   if(valida == true){
     return Text('Usuário ou senha inválidos', style:  TextStyle(color: Colors.red, 
     fontFamily: 'Alata', fontSize: 15),);
   }else{
     return Text('');
   }
 }

 void save(User user){
   for(var z in _users.values){
     if(z.userName == user.userName || 
     z.cpf == user.cpf || z.email == user.email
     ){
       return user = null;
     }
     }
   print(user);
   if(user == null){
     return;
   }
   if(user != null){
     _users.putIfAbsent('100', () => User(
       id: user.id,
       nome: user.nome,
       cpf: user.cpf,
       email: user.email,
       userName: user.userName,
       senha: user.senha
     ));
     
   }

   notifyListeners();
 }




}