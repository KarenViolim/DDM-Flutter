import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EncomendaForm extends StatelessWidget {
  Widget fieldName() {
    return TextFormField(decoration: InputDecoration(labelText: 'Nome: '));
  }

  Widget fieldCPF() {
    var mask = MaskTextInputFormatter(mask: '###.###.###-##');
    return TextFormField(
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: 'CFP: ', hintText: '999.999.999-99'));
  }

  Widget fieldPedido() {
    return TextFormField(decoration: InputDecoration(labelText: 'Pedido: '));
  }

  Widget fieldTelefone() {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone: ', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldURLImage() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Endereço Foto: ', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Encomendas'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: null)],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            child: Column(
          children: [
            fieldName(),
            fieldCPF(),
            fieldPedido(),
            fieldTelefone(),
            fieldURLImage()
          ],
        )),
      ),
    );
  }
}
