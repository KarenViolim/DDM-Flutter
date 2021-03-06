import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:encomendas_crud/app/domain/interfaces/encomendas_dao.dart';
import 'package:get_it/get_it.dart';

class EncomendaService {
  var _dao = GetIt.I.get<EncomendasDAO>();

  save(Encomenda encomenda) {
    validateNome(encomenda.nome);
    validateCPF(encomenda.cpf);
    validateTelefone(encomenda.telefone);
    validatePedido(encomenda.pedido);
    _dao.save(encomenda);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Encomenda>> find() {
    return _dao.find();
  }

  validateNome(String nome){
    var min = 3;
    var max = 200;

    if(nome == null){
      throw new DomainLayerException('O nome é obrigatório.');
    }else if(nome.length < min){
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(nome.length > max){
      throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateCPF(String cpf){
    var format = RegExp(r'^[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}$');
    if(cpf == null){
      throw new DomainLayerException('O CPF é obrigatório.');      
    }else if(!format.hasMatch(cpf)){
      throw new DomainLayerException('Formato inválido.');
    }
  }

  validatePedido(String pedido){
    var min = 8;
    var max = 200;

    if(pedido == null){
      throw new DomainLayerException('O pedido é obrigatório.');
    }else if(pedido.length < min){
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(pedido.length > max){
      throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateTelefone(String telefone){
    var format = RegExp(r'^\([1-9]{2}\)[9][6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if(telefone == null){
      throw new DomainLayerException('O telefone é obrigatório.');      
    }else if(!format.hasMatch(telefone)){
      throw new DomainLayerException('Formato inválido.');
    }
  }
}
