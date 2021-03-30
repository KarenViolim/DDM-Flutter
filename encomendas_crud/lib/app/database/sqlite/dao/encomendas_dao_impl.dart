import 'package:encomendas_crud/app/database/sqlite/connection.dart';
import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/domain/interfaces/encomendas_dao.dart';
import 'package:sqflite/sqflite.dart';

class EncomendasDAOImpl implements EncomendasDAO {
  Database _db;

  @override
  Future<List<Encomenda>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('encomenda');
    List<Encomenda> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Encomenda(
          id: linha['id'],
          nome: linha['nome'],
          cpf: linha['cpf'],
          pedido: linha['pedido'],
          telefone: linha['telefone'],
          urlAvatar: linha['url_avatar']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM encomenda WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Encomenda encomenda) async {
    _db = await Connection.get();
    var sql;
    if (encomenda.id == null) {
      sql =
          'INSERT INTO encomenda (nome,cpf,pedido,telefone,url_avatar) VALUES(?,?,?,?,?)';
      _db.rawInsert(sql, [
        encomenda.nome,
        encomenda.cpf,
        encomenda.pedido,
        encomenda.telefone,
        encomenda.urlAvatar
      ]);
    } else {
      sql =
          'UPDATE encomenda SET nome = ?, cpf = ?, pedido = ?, telefone = ?, url_avatar = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        encomenda.nome,
        encomenda.cpf,
        encomenda.pedido,
        encomenda.telefone,
        encomenda.urlAvatar
      ]);
    }
  }
}
