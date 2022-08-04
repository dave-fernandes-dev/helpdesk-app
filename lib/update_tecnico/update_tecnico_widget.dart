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

class UpdateTecnicoWidget extends StatefulWidget {
  const UpdateTecnicoWidget({
    Key? key,
    this.tecnicoId,
  }) : super(key: key);

  final String? tecnicoId;

  @override
  _UpdateTecnicoWidgetState createState() => _UpdateTecnicoWidgetState();
}

class _UpdateTecnicoWidgetState extends State<UpdateTecnicoWidget> {
  ApiCallResponse? responsePutTecnico550482150;
  String? dropDownValue;
  TextEditingController? textFieldNomeController;
  TextEditingController? textFieldCpfController;
  TextEditingController? textFieldEmailController;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textFieldSenhaVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetTecnicoByIdCall.call(
        id: widget.tecnicoId,
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
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final updateTecnicoGetTecnicoByIdResponse = snapshot.data!;
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
              'Atualizar Técnico',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'assets/images/tecnico-create.svg',
                    width: double.infinity,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 5, 12, 0),
                    child: FlutterFlowDropDown(
                      options: (GetTecnicoByIdCall.perfis(
                        updateTecnicoGetTecnicoByIdResponse.jsonBody,
                      ) as List)
                          .map<String>((s) => s.toString())
                          .toList()
                          .toList(),
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: double.infinity,
                      height: 40,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: 'Selecione...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: FlutterFlowTheme.of(context).primaryColor,
                      borderWidth: 0,
                      borderRadius: 6,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                    child: TextFormField(
                      controller: textFieldNomeController ??=
                          TextEditingController(
                        text: GetTecnicoByIdCall.nome(
                          updateTecnicoGetTecnicoByIdResponse.jsonBody,
                        ).toString(),
                      ),
                      onChanged: (_) => EasyDebounce.debounce(
                        'textFieldNomeController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Nome',
                        hintText: 'Digite o Nome',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        suffixIcon: textFieldNomeController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textFieldNomeController?.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                    child: TextFormField(
                      controller: textFieldCpfController ??=
                          TextEditingController(
                        text: GetTecnicoByIdCall.cpf(
                          updateTecnicoGetTecnicoByIdResponse.jsonBody,
                        ).toString(),
                      ),
                      onChanged: (_) => EasyDebounce.debounce(
                        'textFieldCpfController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'CPF',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        suffixIcon: textFieldCpfController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textFieldCpfController?.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                    child: TextFormField(
                      controller: textFieldEmailController ??=
                          TextEditingController(
                        text: GetTecnicoByIdCall.email(
                          updateTecnicoGetTecnicoByIdResponse.jsonBody,
                        ).toString(),
                      ),
                      onChanged: (_) => EasyDebounce.debounce(
                        'textFieldEmailController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Email',
                        hintText: 'Digite um Email Válido...',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        suffixIcon: textFieldEmailController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textFieldEmailController?.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                    child: TextFormField(
                      controller: textFieldSenhaController ??=
                          TextEditingController(
                        text: GetTecnicoByIdCall.senha(
                          updateTecnicoGetTecnicoByIdResponse.jsonBody,
                        ).toString(),
                      ),
                      obscureText: !textFieldSenhaVisibility,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Senha',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => textFieldSenhaVisibility =
                                !textFieldSenhaVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            textFieldSenhaVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        responsePutTecnico550482150 = await PutTecnicoCall.call(
                          token: FFAppState().token,
                          id: widget.tecnicoId,
                          nome: textFieldNomeController?.text ?? '',
                          cpf: textFieldCpfController?.text ?? '',
                          email: textFieldEmailController?.text ?? '',
                          senha: textFieldSenhaController?.text ?? '',
                        );
                        if ((responsePutTecnico550482150?.succeeded ?? true)) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Sucesso'),
                                content: Text('Atualizado com Sucesso!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Erro!'),
                                content: Text('Não Atualizado!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {});
                      },
                      text: 'Atualizar',
                      icon: Icon(
                        Icons.system_update_alt,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 130,
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
        );
      },
    );
  }
}
