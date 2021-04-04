import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/view/encomenda_details_back.dart';
import 'package:flutter/material.dart';

class EncomendaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = EncomendaDetailsBack(context);
    Encomenda encomenda = _back.encomenda;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        //var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              (Uri.tryParse(encomenda.urlAvatar).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(encomenda.urlAvatar),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(Icons.person, size: width / 2),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${encomenda.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone'),
                  subtitle: Text('${encomenda.telefone}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Pedido'),
                  subtitle: Text('${encomenda.pedido}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
