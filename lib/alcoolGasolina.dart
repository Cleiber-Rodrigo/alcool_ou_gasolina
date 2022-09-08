import 'package:flutter/material.dart';
class HomeAlcool extends StatefulWidget {
  const HomeAlcool({Key? key}) : super(key: key);

  @override
  State<HomeAlcool> createState() => _HomeAlcoolState();
}

class _HomeAlcoolState extends State<HomeAlcool> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  //Criando a função para calcular
  void _calcular (){
    //Se a variável receber direto o _controllerAlcool.text, o valor vai vir como string, então não consigo fazer cálculos
    //usamos o double.tryparse ou double.parse para transformar o valor em double. A diferença é que se o parse não conseguir
    //fazer a conversão, ele exibe uma msg de erro, e o tryparse exibe um valor nulo
    var precoAlcool = double.tryParse(_controllerAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);
    if( precoAlcool == null || precoGasolina ==null){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando ' . '";
      });
    }else if(
    (precoAlcool / precoGasolina >=0.7)
    ){
      setState(() {
        _textoResultado = "Melhor abastecer com gasolina";
      });
    }else{
      setState(() {
        _textoResultado = "Melhor abastecer com alcool";
      });
    }
    /* _limparCampos(); */
  }

  //Se eu quiser limpar as caixas de texto após calclular o resultado:
  /*
  void _limparCampos (){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        //Usamos para rolar a tela para visualizar todo o conteúdo
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child:  Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10 ,bottom: 20, right: 20, left: 20),
                child: Text(
                  "Saiba qual é a melhor opção para abastecer o seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, right: 20, left: 20),
                //O TextField é um campo de texto digitável
                child: TextField(
                  //Definimos o tipo de teclado que irá aparecer para o usuário
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //É o que queremos que apareça na caixa de texto
                    labelText: "Preço Alcool, ex: 1.59",
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  //Controla a caixa de texto. Usamos para capturar dados
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.15",
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
