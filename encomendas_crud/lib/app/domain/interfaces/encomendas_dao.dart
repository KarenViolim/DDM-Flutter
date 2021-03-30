
import 'package:encomendas_crud/app/domain/entities/encomenda.dart';

abstract class EncomendasDAO{
  save(Encomenda encomenda);

  remove(int id);

  Future<List<Encomenda>> find();
}