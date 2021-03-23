import 'package:flutter/material.dart';

class EncomendaForm extends StatefulWidget {
  @override
  _EncomendaFormState createState() => _EncomendaFormState();
}

class _EncomendaFormState extends State<EncomendaForm> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Encomendas")),
    );
  }
}