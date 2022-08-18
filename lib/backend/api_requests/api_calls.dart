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
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
    String? perfisFf = 'ADMIN,CLIENTE,TECNICO',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}",
  "perfisFf": "${perfisFf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTecnico',
      apiUrl: '${apiUrl}/tecnicos?body',
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
        'perfisFf': perfisFf,
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
    String? perfis = '[\"ADMIN\",\"CLIENTE\",\"TECNICO\"]',
    String? perfisFf = 'ADMIN,CLIENTE,TECNICO',
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}",
  "perfisFf": "${perfisFf}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'putTecnico',
      apiUrl: '${apiUrl}/tecnicos/${id}',
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
        'perfis': perfis,
        'perfisFf': perfisFf,
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
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "cpf": "${cpf}",
  "email": "${email}",
  "senha": "${senha}",
  "perfis": ["CLIENTE"]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postCliente',
      apiUrl: '${apiUrl}/clientes?with_response_body',
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
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChamados',
      apiUrl: '${apiUrl}/chamados',
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
    String? prioridadeDescricao = '',
    String? status = '',
    String? titulo = '',
    String? observacoes = '',
    int? tecnicoId,
    int? clienteId,
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
    String? nomeTecnico = '',
    String? nomeCliente = '',
  }) {
    final body = '''
{
  "prioridadeDescricao": "${prioridadeDescricao}",
  "status": "0",
  "titulo": "${titulo}",
  "nomeTecnico": "${nomeTecnico}",
  "nomeCliente": "${nomeCliente}",
  "observacoes": "${observacoes}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postChamado',
      apiUrl: '${apiUrl}/chamados?with_response_body',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'prioridadeDescricao': prioridadeDescricao,
        'status': status,
        'titulo': titulo,
        'observacoes': observacoes,
        'tecnicoId': tecnicoId,
        'clienteId': clienteId,
        'nomeTecnico': nomeTecnico,
        'nomeCliente': nomeCliente,
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
    String? prioridadeDescricao = '',
    String? statusDescricao = '',
    String? titulo = '',
    String? nomeTecnico = '',
    String? nomeCliente = '',
    String? observacoes = '',
  }) {
    final body = '''
{
  "prioridadeDescricao": "${prioridadeDescricao}",
  "statusDescricao": "${statusDescricao}",
  "titulo": "${titulo}",
  "nomeTecnico": "${nomeTecnico}",
  "nomeCliente": "${nomeCliente}",
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
        'prioridadeDescricao': prioridadeDescricao,
        'statusDescricao': statusDescricao,
        'titulo': titulo,
        'nomeTecnico': nomeTecnico,
        'nomeCliente': nomeCliente,
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

class GetChamadosByFilterCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? titulo = '',
    String? status = '',
    String? apiUrl = 'https://vl-helpdesk-api.herokuapp.com',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChamadosByFilter',
      apiUrl: '${apiUrl}/chamados?filter&titulo=${titulo}&status=${status}',
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

class PatchTecnicoPerfisCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
    String? perfis = 'CLIENTE,TECNICO',
  }) {
    final body = '''
{
  "perfis": "${perfis}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'patchTecnico Perfis',
      apiUrl: 'https://vl-helpdesk-api.herokuapp.com/tecnicos/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Authorization': '${token}',
      },
      params: {
        'perfis': perfis,
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
