import 'package:encomendas_crud/app/database/sqlite/dao/encomendas_dao_impl.dart';
import 'package:encomendas_crud/app/domain/interfaces/encomendas_dao.dart';
import 'package:encomendas_crud/app/domain/services/encomendas_services.dart';
import 'package:get_it/get_it.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<EncomendasDAO>(EncomendasDAOImpl());
  getit.registerSingleton<EncomendaService>(EncomendaService());
}