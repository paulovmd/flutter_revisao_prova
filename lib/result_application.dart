// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_revisao_prova/aluno.dart';

class ResultApplication {

  bool? success;
  String? message;
  String? error;  
  List? dados;
  Aluno? aluno;
  ResultApplication({
    this.success,
    this.message,
    this.error,
    this.dados,
    this.aluno,
  });
  
 

  ResultApplication copyWith({
    bool? success,
    String? message,
    String? error,
    List? dados,
    Aluno? aluno,
  }) {
    return ResultApplication(
      success: success ?? this.success,
      message: message ?? this.message,
      error: error ?? this.error,
      dados: dados ?? this.dados,
      aluno: aluno ?? this.aluno,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'error': error,
      'dados': dados,
      'aluno': aluno == null ? Aluno().toMap() : aluno?.toMap(),
    };
  }

  factory ResultApplication.fromMap(Map<String, dynamic> map) {
    return ResultApplication(
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
      dados: map['dados'] != null ? map['dados'] as List: null,
      aluno: map['aluno'] != null ? Aluno.fromMap(map['aluno']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultApplication.fromJson(String source) => ResultApplication.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultApplication(success: $success, message: $message, error: $error, dados: $dados, aluno: $aluno)';
  }

  @override
  bool operator ==(covariant ResultApplication other) {
    if (identical(this, other)) return true;
  
    return 
      other.success == success &&
      other.message == message &&
      other.error == error &&
      other.dados == dados &&
      other.aluno == aluno;
  }

  @override
  int get hashCode {
    return success.hashCode ^
      message.hashCode ^
      error.hashCode ^
      dados.hashCode ^
      aluno.hashCode;
  }
}
