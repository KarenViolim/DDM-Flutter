import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:flutter/cupertino.dart';

class EncomendaDetailsBack {
  BuildContext context;
  Encomenda encomenda;

  EncomendaDetailsBack(this.context){
    encomenda = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
}