import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //permite os metodos para consumo da api
import 'dart:convert'; //pacote que permite a conversão dos dados

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
 
class _HomeState extends State<Home> {

    TextEditingController cep = TextEditingController();
    String ? logradouro;
    String ? bairro;
    String ? cidade;
    String ? estado;
    String ? ddd;
    String ? erro;
  @override
  State<Home> createState() => _HomeState();

  _consultaCep () async{ //async pois a comunicação é assincrona
    String url = "https://cep.awesomeapi.com.br/${cep.text}";
    //api para consultar o endereço atravez do cep
    http.Response response; //variável para armazenar a resposta da api
    response = await http.get(Uri.parse(url)); //response armazena a resposta da api
    print("Código de status da API: ${response.statusCode.toString()}");
    print("Resposta da API: ${response.body}"); //respota da API
    if (response.statusCode.toString() == "200")
    {Map<String,dynamic> dados = json.decode(response.body);
    setState(() {
    logradouro = dados["address"];
    bairro = dados["district"];
    cidade = dados["city"];
    estado = dados["state"];
    ddd = dados["ddd"];
    erro = "";
    });

    print("Rua: $logradouro");
    print("Bairro: $bairro");
    print("Cidade: $cidade");
    print("Estado: $estado");
    print("DDD: $ddd");}


    else {
      setState(() {
        logradouro = "---";
        bairro = "---";
        cidade = "---";
        estado = "---";
        ddd = "---";
        erro = "CEP INVÁLIDO! TENTE NOVAMENTE";
      });
      print("ERRO NA API");
      
    }
}

_limpar () {
  setState(() {
     cep.text="";
  });
 
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("App Consulta CEP"),
      backgroundColor: Color.fromARGB(255, 203, 240, 72),
    ),
    body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
    children: [
      TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Digite seu CEP (somente números)",
          alignLabelWithHint: true,
        ),
        controller: cep,
      ),
      SizedBox(height: 20), // Adiciona espaço entre o TextField e o Container
      ElevatedButton(
        onPressed: _consultaCep,
        child: Icon(Icons.search),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Cor de fundo do botão
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)), // Preenchimento interno do botão
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Bordas arredondadas  
            ),
          ),
        ),
      ),
      ElevatedButton(onPressed: _limpar, child: Icon(Icons.delete),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Cor de fundo do botão
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)), // Preenchimento interno do botão
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Bordas arredondadas  
            ),
          ),
        ),),
      SizedBox(height: 20), // Adiciona espaço entre o Container e o próximo widget
      Container(
        width: 400,
        height: 250,
        color: Color.fromARGB(255, 228, 226, 132),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${erro}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("${logradouro}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Text("Bairro: ${bairro}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            Text("Cidade: ${cidade}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text("Estado: ${estado}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text("DDD: ${ddd}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            
          ],
        ),
      ),
    ],
  ),
),
  );
}
  }
