// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encomenda_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EncomendaListBack on _EncomendaListBack, Store {
  final _$listAtom = Atom(name: '_EncomendaListBack.list');

  @override
  Future<List<Encomenda>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Encomenda>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_EncomendaListBackActionController =
      ActionController(name: '_EncomendaListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_EncomendaListBackActionController.startAction(
        name: '_EncomendaListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_EncomendaListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
