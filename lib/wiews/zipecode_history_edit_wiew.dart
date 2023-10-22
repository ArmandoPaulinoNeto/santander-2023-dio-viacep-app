import 'package:consult_zipecode_app/entities/zipecode_entity.dart';
import 'package:flutter/material.dart';

import '../services/back4app_service.dart';
import 'history_zipecode_wiew.dart';

class ZipecodeHistoryEdit extends StatefulWidget {
  ZipecodeEntity zipecodeEntity;
  ZipecodeHistoryEdit({super.key, required this.zipecodeEntity});

  @override
  State<ZipecodeHistoryEdit> createState() => _ZipecodeHistoryEditState();
}

class _ZipecodeHistoryEditState extends State<ZipecodeHistoryEdit> {
  final _formKey = GlobalKey<FormState>();

  String cep = "";
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ibge = "";
  String gia = "";
  String ddd = "";
  String siafi = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Edit Zipecode"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)), color: Colors.teal[700]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.blue[900],
                      child: SizedBox(
                        height: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView(children: [
                            TextFormField(
                              initialValue: widget.zipecodeEntity.cep,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Cep:", hintText: "Por favor, digite seu cep."),
                              validator: (value) => value!.isEmpty || value.replaceAll('r[^0-9]', "").length < 8 ? "Por favor, preencha o cep corretamente" : null,
                              onSaved: (value) => cep = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.logradouro,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Logradouro:", hintText: "Por favor, digite o logradouro."),
                              onSaved: (value) => logradouro = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.complemento,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Complemento:", hintText: "Por favor, digite o complemento."),
                              onSaved: (value) => complemento = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.bairro ?? "?",
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Bairro:", hintText: "Por favor, digite o bairro."),
                              onSaved: (value) => bairro = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.localidade,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Localidade:", hintText: "Por favor, digite a localidade."),
                              validator: (value) => value!.isEmpty || value.length < 4 ? "Por favor, preencha localidade corretamente" : null,
                              onSaved: (value) => localidade = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.uf,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Uf:", hintText: "Por favor, digite o Uf."),
                              validator: (value) => value!.isEmpty || value.length < 2 ? "Por favor, preencha o Uf corretamente" : null,
                              onSaved: (value) => uf = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.ibge,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "IBGE:", hintText: "Por favor, digite o IBGE."),
                              validator: (value) => value!.isEmpty || value.replaceAll('r[^0-9]', "").length < 4 ? "Por favor, preencha o IBGE corretamente" : null,
                              onSaved: (value) => ibge = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.gia,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Gia:", hintText: "Por favor, digite o Gia."),
                              onSaved: (value) => gia = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.ddd,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "DDD:", hintText: "Por favor, digite o DDD."),
                              validator: (value) => value!.isEmpty || value.replaceAll('r[^0-9]', "").length < 2 ? "Por favor, preencha o DDD corretamente" : null,
                              onSaved: (value) => ddd = value!,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              initialValue: widget.zipecodeEntity.siafi,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Siafi:", hintText: "Por favor, digite o Siafi."),
                              validator: (value) => value!.isEmpty || value.replaceAll('r[^0-9]', "").length < 2 ? "Por favor, preencha o Siafi corretamente" : null,
                              onSaved: (value) => siafi = value!,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                            child: Text("Cancelar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                            child: Text("Salvar"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ZipecodeEntity zipecode = ZipecodeEntity(
                                    id: widget.zipecodeEntity.id,
                                    cep: cep,
                                    logradouro: logradouro,
                                    complemento: complemento,
                                    bairro: bairro,
                                    localidade: localidade,
                                    uf: uf,
                                    ibge: ibge,
                                    gia: gia,
                                    ddd: ddd,
                                    siafi: siafi);
                                BackFourAppService backFourAppService = BackFourAppService();
                                backFourAppService.upadateZipecode(zipecode);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          child: Wrap(children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.indigo,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Text(
                                                  "O cep foi atualizado com sucesso!",
                                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: ElevatedButton(
                                                          child: Text(
                                                            "Ok!",
                                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                            Navigator.of(context).pop();
                                                            Navigator.of(context).pop();
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ZipecodeHistory(zipecodeList: BackFourAppService().getAllZipecode())));
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    );
                                  }
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
