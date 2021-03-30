import 'package:encomendas_crud/app/database/sqlite/dao/encomendas_dao_impl.dart';
import 'package:encomendas_crud/app/domain/entities/encomenda.dart';
import 'package:encomendas_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class EncomendaList extends StatelessWidget {
//  final lista=[
//    {'nome':'Santiago','telefone':'(44)99766-0895','avatar':'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'},
//    {'nome':'Karen','telefone':'(44)99826-4674','avatar':'https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027367_960_720.png'},
//    {'nome':'Manuela','telefone':'(44)98828-6889','avatar':'https://cdn.pixabay.com/photo/2021/03/12/08/01/child-6089047_960_720.png'},

//  ];

  Future<List<Encomenda>> _buscar() async {
    return EncomendasDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Encomenda> lista = futuro.data;
            return Scaffold(
              appBar: AppBar(
                title: Text("Lista de Encomendas"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.ENCOMENDA_FORM);
                    },
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var encomenda = lista[i];
                  var avatar = CircleAvatar(
                      backgroundImage: NetworkImage(encomenda.urlAvatar));
                  return ListTile(
                    leading: avatar,
                    title: Text(encomenda.nome),
                    subtitle: Text(encomenda.pedido),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: null,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
