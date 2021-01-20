import 'package:flutter/cupertino.dart';

class Loja{
  final String id;
  final String nome;
  final String foto;
  final String cnpj;
  final String endereco;
  final String produtos;
  final String categoria;
  final String nameUser;
  final String senha;

   const Loja({
    this.id,
    @required this.nome,
    @required this.foto,
    @required this.cnpj,
    @required this.endereco,
    @required this.produtos,
    @required this.categoria,
    @required this.nameUser,
    @required this.senha
    
  });

 

 
}