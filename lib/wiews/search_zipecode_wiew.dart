import 'dart:convert';

import 'package:flutter/material.dart';

import '../entities/zipecode_entity.dart';
import '../services/back4app_service.dart';
import '../services/zipecode_service.dart';

class SearchZipecode extends StatefulWidget {
  const SearchZipecode({super.key});

  @override
  State<SearchZipecode> createState() => _SearchZipecodeState();
}

class _SearchZipecodeState extends State<SearchZipecode> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Bem vindo!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Card(
              elevation: 10,
              color: Colors.green[900],
              child: Image.network("https://s3.amazonaws.com/appforest_uf/f1519547432570x648548603290692000/Screenshot%202018-02-25%20at%2009.24.39.png"),
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Cep", border: OutlineInputBorder(), hintText: "Digite seu Cep."),
                        onChanged: (value) async {
                          value = value.replaceAll('r[0-9]', '');
                          if (value.trim().isNotEmpty && value.length == 8) {
                            _formKey.currentState!.reset();
                            ZipecodeService zipecodeService = ZipecodeService();
                            ZipecodeEntity zipecodeEntity = await zipecodeService.get(value, 0);
                            if (zipecodeEntity.cep != null) {
                              BackFourAppService backFourAppService = BackFourAppService();
                              var response = await backFourAppService.getAllZipecode();
                              if (response != null) {
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        child: Wrap(
                                          children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.indigo,
                                                child: 
                                                  Container(
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Cep: ${zipecodeEntity.cep}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Logradouro: ${zipecodeEntity.logradouro}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Complemento: ${zipecodeEntity.complemento}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Bairro: ${zipecodeEntity.bairro}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Localidade: ${zipecodeEntity.localidade}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Uf: ${zipecodeEntity.uf}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Ibge: ${zipecodeEntity.ibge}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Gia: ${zipecodeEntity.gia}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("DDD: ${zipecodeEntity.ddd}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 4.0,
                                                          ),
                                                          Text("Siafi: ${zipecodeEntity.siafi}",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    alignment: Alignment.centerRight,
                                                    child: ElevatedButton(
                                                      child: Text("Salvar cep",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white
                                                        ),
                                                      ),
                                                  onPressed: () {
                                                    var maps = jsonDecode(response.body);
                                                    var zipecode = maps['results'].where((it) => zipecodeEntity.cep == it['cep']);
                                                    if (zipecode == null || zipecode.toString().contains("()")) {
                                                      backFourAppService.saveZipecode(zipecodeEntity);
                                                      Navigator.of(context).pop();
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
                                                  "O cep foi cadastrado com sucesso!",
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
                                                        }
                                                      ),
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
                                                    } else {
                                                      Navigator.of(context).pop();
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Center(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(20),
                                                              child: Container(
                                                                child: Wrap(
                                                                  children: [
                                                                    Card(
                                                                      elevation: 10,
                                                                      color: Colors.indigo,
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(20),
                                                                        child: Text("Ocorreu uma falha ao tentar salvar o cep ou o mesmo já está cadastrado.",
                                                                          style: TextStyle(
                                                                            fontSize: 20,
                                                                            color: Colors.white
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Container(
                                                                        alignment: Alignment.centerRight,
                                                                        child: ElevatedButton(
                                                                          child: Text("Ok!",
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Colors.white
                                                                            ),
                                                                          ),
                                                                          onPressed: () => Navigator.of(context).pop(),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ]
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: ElevatedButton(
                                                  child: Text("Sair",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                  onPressed: () => Navigator.of(context).pop(),
                                                ),
                                              ),
                                            ),                                          
                                          ]
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        child: Wrap(
                                          children: [
                                            Card(
                                              elevation: 10,
                                              color: Colors.indigo,
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Text("O cep informado não foi encontrado.",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.centerRight,
                                                child: ElevatedButton(
                                                  child: Text("Ok!",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                  onPressed: () => Navigator.of(context).pop(),
                                                ),
                                              ),
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    ));
  }
}
