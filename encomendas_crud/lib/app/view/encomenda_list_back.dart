import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/domain/services/encomendas_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'encomenda_list_back.g.dart';

class EncomendaListBack = _EncomendaListBack with _$EncomendaListBack;

abstract class _EncomendaListBack with Store {
  var _service = GetIt.I.get<EncomendaService>();

//lista de encomendas
  @observable
  Future<List<Encomenda>> list;

//métodos para atualizar a lista de encomendas
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _EncomendaListBack() {
    refreshList();
  }

//método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Encomenda encomenda]) {
    Navigator.of(context)
        .pushNamed(MyApp.ENCOMENDA_FORM, arguments: encomenda)
        .then(refreshList);
  }

//excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
