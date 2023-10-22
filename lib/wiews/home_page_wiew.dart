import 'dart:convert';
import 'package:consult_zipecode_app/services/back4app_service.dart';
import 'package:consult_zipecode_app/wiews/search_zipecode_wiew.dart';
import 'package:flutter/material.dart';
import 'history_zipecode_wiew.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.teal[500]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "pesquisar",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchZipecode()));
                            },
                            icon: Icon(Icons.search_outlined))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.teal[700]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Historico",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                            color: Colors.white,
                            onPressed: () {
                              BackFourAppService backFourAppService = BackFourAppService();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ZipecodeHistory(
                                            zipecodeList: backFourAppService.getAllZipecode(),
                                          )));
                            },
                            icon: Icon(Icons.history_edu_outlined))
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
