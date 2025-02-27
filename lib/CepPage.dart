import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Ceppage extends StatefulWidget {
  const Ceppage({super.key});

  @override
  State<Ceppage> createState() => _CeppageState();
}

class _CeppageState extends State<Ceppage> {
  String cep = "";
  String rua ="";
  String bairro ="";
  String cidade ="";

  Future<void> obterEndereco() async {
     final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
  print(response.data["logradouro"]);
  print(response.data["bairro"]);
  print(response.data["localidade"]);

  setState(() {
    rua = response.data["logradouro"];
  bairro = response.data["bairro"];
  cidade = response.data["localidade"]; 
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Pagina para Consultar Cep"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (valor){
                setState(() {
                 cep = valor; 
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(), 
              )
              
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: obterEndereco, child: Text("Consultar")),
                Text("CEP:"),
                Text(cep),
                Text("Rua"),
                Text(rua),
                Text("Bairro"),
                Text(bairro),
                Text("Cidade"),
                Text(cidade),
                
              ], 
            ),
      ),
    ); 
  }
}