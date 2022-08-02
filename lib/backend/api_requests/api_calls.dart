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
