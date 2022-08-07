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
