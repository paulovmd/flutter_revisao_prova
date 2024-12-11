import 'package:flutter/material.dart';
import 'package:flutter_revisao_prova/aluno.dart';
import 'package:flutter_revisao_prova/aluno_controller.dart';
import 'package:flutter_revisao_prova/helper_widgets.dart';
import 'package:flutter_revisao_prova/result_application.dart';

void main() {
  runApp(const RevisaoProvaMain());
}

class RevisaoProvaMain extends StatelessWidget {
const RevisaoProvaMain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Main(),);
  }
}

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  
  //Objetos que capturam os textos de cada caixa de texto
  var codigoTextController = TextEditingController();
  var nomeTextController = TextEditingController();

  //Declarando o Controlador para consumir a API
  var alunoController = AlunoController();
  var aluno = Aluno();

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
            IconButton(onPressed: () => _incluir(), icon: const Icon(Icons.add)),
            IconButton(onPressed: () => _excluir(), icon: const Icon(Icons.delete)),
            IconButton(onPressed: () => _atualizar(), icon: const Icon(Icons.update))
        ],
        title: const Text('Revisão Prova'),
      ),
      body: _createBody(context),
    );
  }
  
  Widget _createBody(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
      child: Form(child: Column(
              children: [
                  HelperWidgets.createTextForm("Código", "", codigoTextController),
                  HelperWidgets.createTextForm("Nome", "", nomeTextController),
              ],
        ),      
      ),    
    );
  }
  
  void _incluir() async{
    _defineDados();
    ResultApplication result = await alunoController.inserir(aluno);
    await _exibeMensagem(result);

  }

  Future<void> _exibeMensagem(ResultApplication result) async {
    if (result.success!){
        await HelperWidgets.showMessageDialog(result.message!, context);
    }
    else{
        var mensagem = "${result.message} \n ${result.error}";
        await HelperWidgets.showMessageDialog(mensagem, context);
    }
  }

  void _defineDados() {
    aluno.codigo = int.tryParse(codigoTextController.text);
    aluno.nome = nomeTextController.text;
  }
  
  void _excluir() async{    
    _defineDados();
    ResultApplication result = await alunoController.excluir(aluno.codigo!);
    await _exibeMensagem(result);
  }

  void _atualizar() async{   
    _defineDados();
    ResultApplication result = await alunoController.atualizar(aluno);
    await _exibeMensagem(result);
  }
  

}


