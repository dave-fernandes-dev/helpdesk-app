import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateChamadoWidget extends StatefulWidget {
  const UpdateChamadoWidget({
    Key? key,
    this.chamadoId,
  }) : super(key: key);

  final String? chamadoId;

  @override
  _UpdateChamadoWidgetState createState() => _UpdateChamadoWidgetState();
}

class _UpdateChamadoWidgetState extends State<UpdateChamadoWidget> {
  ApiCallResponse? responseUpdateChamado;
  String? dropDownClienteValue;
  String? dropDownPrioridadeValue;
  String? dropDownStatusValue;
  TextEditingController? textFieldTituloController;
  String? dropDownTecnicoValue;
  TextEditingController? textFieldObsController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetChamadoByIdCall.call(
        token: FFAppState().token,
        id: widget.chamadoId,
        apiUrl: FFAppState().apiUrl,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final updateChamadoGetChamadoByIdResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Atualizar Chamado',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/tecnico-create.svg',
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 6),
                        child: TextFormField(
                          controller: textFieldTituloController ??=
                              TextEditingController(
                            text: getJsonField(
                              updateChamadoGetChamadoByIdResponse.jsonBody,
                              r'''$.titulo''',
                            ).toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            'textFieldTituloController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Título',
                            hintText: 'Digite o Título...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            suffixIcon: textFieldTituloController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => textFieldTituloController?.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Status',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 6),
                        child: FlutterFlowDropDown(
                          initialOption: dropDownStatusValue ??= getJsonField(
                            updateChamadoGetChamadoByIdResponse.jsonBody,
                            r'''$.statusDescricao''',
                          ).toString(),
                          options: ['ABERTO', 'ANDAMENTO', 'ENCERRADO'],
                          onChanged: (val) =>
                              setState(() => dropDownStatusValue = val),
                          width: double.infinity,
                          height: 47,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: 'Status do Chamado',
                          icon: Icon(
                            Icons.storage,
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          borderWidth: 0,
                          borderRadius: 6,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Text(
                              'Prioridade',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: FlutterFlowDropDown(
                          initialOption: dropDownPrioridadeValue ??=
                              getJsonField(
                            updateChamadoGetChamadoByIdResponse.jsonBody,
                            r'''$.prioridadeDescricao''',
                          ).toString(),
                          options: ['BAIXA', 'MEDIA', 'ALTA'],
                          onChanged: (val) =>
                              setState(() => dropDownPrioridadeValue = val),
                          width: double.infinity,
                          height: 47,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: 'Please select...',
                          icon: Icon(
                            Icons.star_rounded,
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          borderWidth: 0,
                          borderRadius: 6,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 6, 0, 0),
                            child: Text(
                              'Técnico',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetTecnicosCall.call(
                            token: FFAppState().token,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final dropDownTecnicoGetTecnicosResponse =
                                snapshot.data!;
                            return FlutterFlowDropDown(
                              initialOption: dropDownTecnicoValue ??=
                                  getJsonField(
                                updateChamadoGetChamadoByIdResponse.jsonBody,
                                r'''$.nomeTecnico''',
                              ).toString(),
                              options: (getJsonField(
                                dropDownTecnicoGetTecnicosResponse.jsonBody,
                                r'''$[*].nome''',
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownTecnicoValue = val),
                              width: double.infinity,
                              height: 47,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Please select Tecnico...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              borderWidth: 0,
                              borderRadius: 6,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 10, 12, 0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetClientesCall.call(
                            token: FFAppState().token,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            final dropDownClienteGetClientesResponse =
                                snapshot.data!;
                            return FlutterFlowDropDown(
                              initialOption: dropDownClienteValue ??=
                                  getJsonField(
                                updateChamadoGetChamadoByIdResponse.jsonBody,
                                r'''$.nomeCliente''',
                              ).toString(),
                              options: (getJsonField(
                                dropDownClienteGetClientesResponse.jsonBody,
                                r'''$[*].nome''',
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownClienteValue = val),
                              width: double.infinity,
                              height: 47,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Please select Cliente...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              borderWidth: 0,
                              borderRadius: 6,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 10, 12, 0),
                        child: TextFormField(
                          controller: textFieldObsController ??=
                              TextEditingController(
                            text: getJsonField(
                              updateChamadoGetChamadoByIdResponse.jsonBody,
                              r'''$.observacoes''',
                            ).toString(),
                          ),
                          onChanged: (_) => EasyDebounce.debounce(
                            'textFieldObsController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Observações',
                            hintText: 'Digite...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                            suffixIcon: textFieldObsController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => textFieldObsController?.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (formKey.currentState == null ||
                                !formKey.currentState!.validate()) {
                              return;
                            }

                            responseUpdateChamado = await PutChamadoCall.call(
                              token: FFAppState().token,
                              apiUrl: FFAppState().apiUrl,
                              id: widget.chamadoId,
                              prioridade: dropDownPrioridadeValue,
                            );
                            if ((responseUpdateChamado?.succeeded ?? true)) {
                              context.pushNamed('ListClientes');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Salvo com Sucesso!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    PutChamadoCall.message(
                                      (responseUpdateChamado?.jsonBody ?? ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFFFF0000),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    PutChamadoCall.fieldNameError(
                                      (responseUpdateChamado?.jsonBody ?? ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFFFF0000),
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: 'Atualizar',
                          icon: Icon(
                            Icons.create,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
