import 'package:flutter_revisao_prova/aluno.dart';
import 'package:flutter_revisao_prova/controller_base.dart';
import 'package:flutter_revisao_prova/result_application.dart';

class AlunoController extends ControllerBase{

  Future<ResultApplication> inserir(Aluno aluno) async{
    return await post("Inserir", aluno.toJson());
  }

  Future<ResultApplication> atualizar(Aluno aluno) async{
    return await put("Atualizar", aluno.toJson());
  }

  Future<ResultApplication> excluir(int codigo) async{
    return await delete("Excluir($codigo)");
  }
  
  Future<ResultApplication> buscar(int codigo) async{
    //Map<String, String> parametros = {"codigo" : codigo.toString()};
    return await get("Buscar($codigo)");
  }

}