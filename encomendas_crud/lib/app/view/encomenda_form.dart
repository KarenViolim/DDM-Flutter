import 'package:encomendas_crud/app/view/encomenda_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EncomendaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldName(EncomendaFormBack back) {
    return TextFormField(
        validator: back.validateNome,
        onSaved: (newValue) => back.encomenda.nome = newValue,
        initialValue: back.encomenda.nome,
        decoration: InputDecoration(labelText: 'Nome: '));
  }

  Widget fieldCPF(EncomendaFormBack back) {
    var mask = MaskTextInputFormatter(mask: '###.###.###-##');
    return TextFormField(
        validator: back.validateCPF,
        onSaved: (newValue) => back.encomenda.cpf = newValue,
        initialValue: back.encomenda.cpf,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration:
            InputDecoration(labelText: 'CFP: ', hintText: '999.999.999-99'));
  }

  Widget fieldPedido(EncomendaFormBack back) {
    return TextFormField(
        validator: back.validatePedido,
        onSaved: (newValue) => back.encomenda.pedido = newValue,
        initialValue: back.encomenda.pedido,
        decoration: InputDecoration(labelText: 'Pedido: '));
  }

  Widget fieldTelefone(EncomendaFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##)#####-####');
    return TextFormField(
        validator: back.validateTelefone,
        onSaved: (newValue) => back.encomenda.telefone = newValue,
        initialValue: back.encomenda.telefone,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone: ', hintText: '(99)99999-9999'));
  }

  Widget fieldURLImage(EncomendaFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.encomenda.urlAvatar = newValue,
        initialValue: back.encomenda.urlAvatar,
        decoration: InputDecoration(
            labelText: 'Endereço Foto: ', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = EncomendaFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Encomendas'),
        actions: [
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: (){
              _form.currentState.validate();
              _form.currentState.save();
              if (_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            }
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
          children: [
            fieldName(_back),
            fieldCPF(_back),
            fieldPedido(_back),
            fieldTelefone(_back),
            fieldURLImage(_back)
          ],
        )),
      ),
    );
  }
}
