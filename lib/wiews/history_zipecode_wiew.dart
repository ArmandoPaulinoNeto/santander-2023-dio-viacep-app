import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../entities/zipecode_entity.dart';
import '../services/back4app_service.dart';
import 'zipecode_history_edit_wiew.dart';

class ZipecodeHistory extends StatefulWidget {
  Future<Response> zipecodeList;
  ZipecodeHistory({super.key, required this.zipecodeList});

  @override
  State<ZipecodeHistory> createState() => _ZipecodeHistoryState();
}

class _ZipecodeHistoryState extends State<ZipecodeHistory> {
  late List<ZipecodeEntity> zipecodeListItems;
  @override
  void initState() {
    zipecodeListItems = List.empty(growable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Zipecodes History"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: widget.zipecodeList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Response response = snapshot.data!;
                  var maps = jsonDecode(response.body);
                  zipecodeListItems = List.generate(maps['results'].length, (index) => ZipecodeEntity.fromJson(maps['results'][index]));
                  return zipecodeListItems.isNotEmpty ? Container(
                    child: ListView.separated(
                        itemBuilder: ((context, index) {
                          return Card(
                            elevation: 8,
                            color: Colors.cyan,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cep: ${zipecodeListItems[index].cep ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Logradouro: ${zipecodeListItems[index].logradouro ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Complemento: ${zipecodeListItems[index].complemento ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Bairro: ${zipecodeListItems[index].bairro ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Localidade: ${zipecodeListItems[index].localidade ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Uf: ${zipecodeListItems[index].uf ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Ibge: ${zipecodeListItems[index].ibge ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Gia: ${zipecodeListItems[index].gia ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "DDD: ${zipecodeListItems[index].ddd ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 4.0,
                                      ),
                                      Text(
                                        "Siafi: ${zipecodeListItems[index].siafi ?? "?"}",
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 250,
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            child: Icon(Icons.delete_rounded),
                                            onPressed: () {
                                              ZipecodeEntity zipecodeEntity = zipecodeListItems[index];
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
                                                                "Deseja realmente excluir o cep cadastrado?",
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
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    child: ElevatedButton(
                                                                      child: Text(
                                                                        "Cancelar",
                                                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                                                      ),
                                                                      onPressed: () => Navigator.of(context).pop(),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.0,
                                                                  ),
                                                                  Container(
                                                                    child: ElevatedButton(
                                                                        child: Text(
                                                                          "Confirmar",
                                                                          style: TextStyle(fontSize: 20, color: Colors.white),
                                                                        ),
                                                                        onPressed: () async {
                                                                          Navigator.of(context).pop();
                                                                          BackFourAppService backFourAppService = BackFourAppService();
                                                                          await backFourAppService.deleteZipecode(zipecodeListItems[index].id!);
                                                                          Navigator.of(context).pop();
                                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ZipecodeHistory(zipecodeList: BackFourAppService().getAllZipecode())));
                                                                        }),
                                                                  )
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
                                            },
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          ElevatedButton(
                                            child: Icon(Icons.edit_note_outlined),
                                            onPressed: () {
                                              ZipecodeEntity zipecodeEntity = zipecodeListItems[index];
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ZipecodeHistoryEdit(zipecodeEntity: zipecodeEntity)));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                        separatorBuilder: (context, index) => Divider(color: Colors.purple[900]),
                        itemCount: zipecodeListItems.length),
                  ) 
                  : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                    child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nenhum registro foi encontrado!",
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          )
                        ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
