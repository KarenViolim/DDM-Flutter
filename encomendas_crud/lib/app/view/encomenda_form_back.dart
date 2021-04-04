import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/domain/services/encomendas_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EncomendaFormBack{
  Encomenda encomenda;
  var _service = GetIt.I.get<EncomendaService>();
  bool _nameIsValid;
  bool _pedidoIsValid;
  bool _telefoneIsValid;
  bool _cpfIsValid;

  bool get isValid => _nameIsValid && _cpfIsValid && _pedidoIsValid && _telefoneIsValid;

  //Diferenciar novo com alteração
  //Serviço de domínio dá acesso as funcionalidades do negócio.
  EncomendaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    encomenda = (parameter == null) ? Encomenda(): parameter;
  }

  //salvar
  save()async{
    await _service.save(encomenda);
  }

  //Fazer validações específicas
  String validateNome(String nome){
    try{
      _service.validateNome(nome);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateCPF(String cpf){
    try{
      _service.validateCPF(cpf);
      _cpfIsValid = true;
      return null;
    }catch(e){
      _cpfIsValid = false;
      return e.toString();
    }
  }

  String validatePedido(String pedido){
    try{
      _service.validatePedido(pedido);
      _pedidoIsValid = true;
      return null;
    }catch(e){
      _pedidoIsValid = false;
      return e.toString();
    }
  }

  String validateTelefone(String telefone){
    try{
      _service.validateTelefone(telefone);
      _telefoneIsValid = true;
      return null;
    }catch(e){
      _telefoneIsValid = false;
      return e.toString();
    }
  }
}