import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class PostLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postLogin',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
      params: {
        'email': email,
        'senha': senha,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
  static dynamic messageError(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetTecnicosCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTecnicos',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PostTecnicoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
    String? cpf = '',
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTecnico',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}

class GetTecnicoByIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTecnicoById',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic perfis(dynamic response) => getJsonField(
        response,
        r'''$.perfis''',
      );
  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.nome''',
      );
  static dynamic cpf(dynamic response) => getJsonField(
        response,
        r'''$.cpf''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic senha(dynamic response) => getJsonField(
        response,
        r'''$.senha''',
      );
}

class DeleteTecnicoByIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTecnicoById',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PutTecnicoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
    String? cpf = '',
    String? email = '',
    String? senha = '',
    String? id = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putTecnico',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}

class GetClientesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getClientes',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/clientes',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic clientes(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class DeleteClienteByIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteClienteById',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/clientes/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PostClienteCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
    String? cpf = '',
    String? email = '',
    String? senha = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postCliente',
      apiUrl:
          'https://vl-helpdesk-api.herokuapp.com/clientes?with_response_body',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}

class GetClienteByIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getClienteById',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/clientes/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic perfis(dynamic response) => getJsonField(
        response,
        r'''$.perfis''',
      );
  static dynamic nome(dynamic response) => getJsonField(
        response,
        r'''$.nome''',
      );
  static dynamic cpf(dynamic response) => getJsonField(
        response,
        r'''$.cpf''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  static dynamic senha(dynamic response) => getJsonField(
        response,
        r'''$.senha''',
      );
}

class PutClienteCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? nome = '',
    String? cpf = '',
    String? email = '',
    String? senha = '',
    String? id = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putCliente',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/clientes/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}

class GetChamadosCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChamados',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/chamados',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic chamados(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic titulo(dynamic response) => getJsonField(
        response,
        r'''$.titulo''',
      );
  static dynamic nomeTecnico(dynamic response) => getJsonField(
        response,
        r'''$.nomeTecnico''',
      );
  static dynamic nomeCliente(dynamic response) => getJsonField(
        response,
        r'''$.nomeCliente''',
      );
  static dynamic dataAbertura(dynamic response) => getJsonField(
        response,
        r'''$.dataAbertura''',
      );
  static dynamic prioridade(dynamic response) => getJsonField(
        response,
        r'''$.prioridade''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class PostChamadoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? prioridade = 0,
    int? status = 0,
    String? titulo = '',
    String? observacoes = '',
    int? tecnicoId,
    int? clienteId,
  }) {
    final body = '''
{
  "prioridade": ${prioridade},
  "status": ${status},
  "titulo": "${titulo}",
  "tecnico": ${tecnicoId},
  "cliente": ${clienteId},
  "observacoes": "${observacoes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postChamado',
      apiUrl:
          'https://vl-helpdesk-api.herokuapp.com/chamados?with_response_body',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'prioridade': prioridade,
        'status': status,
        'titulo': titulo,
        'observacoes': observacoes,
        'tecnicoId': tecnicoId,
        'clienteId': clienteId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}

class GetChamadoByIdCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChamadoById',
      apiUrl: '${apiUrl}/chamados/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PutChamadoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
    String? prioridade = '',
    int? status = 0,
    String? titulo = '',
    int? tecnicoId,
    int? clienteId,
    String? observacoes = '',
  }) {
    final body = '''
{
  "prioridade": "${prioridade}",
  "status": ${status},
  "titulo": "${titulo}",
  "tecnico": ${tecnicoId},
  "cliente": ${clienteId},
  "observacoes": "${observacoes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putChamado',
      apiUrl: '${apiUrl}/chamados/${id}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'prioridade': prioridade,
        'status': status,
        'titulo': titulo,
        'tecnicoId': tecnicoId,
        'clienteId': clienteId,
        'observacoes': observacoes,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic fieldNameError(dynamic response) => getJsonField(
        response,
        r'''$.errors.*.fieldName''',
      );
}
