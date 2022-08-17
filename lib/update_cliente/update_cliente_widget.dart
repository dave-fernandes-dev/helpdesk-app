import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateClienteWidget extends StatefulWidget {
  const UpdateClienteWidget({
    Key? key,
    this.clienteId,
  }) : super(key: key);

  final String? clienteId;

  @override
  _UpdateClienteWidgetState createState() => _UpdateClienteWidgetState();
}

class _UpdateClienteWidgetState extends State<UpdateClienteWidget> {
  ApiCallResponse? responsePutCliente;
  TextEditingController? textFieldCpfController;
  TextEditingController? textFieldNomeController;
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
      future: GetClienteByIdCall.call(
        token: FFAppState().token,
        id: widget.clienteId,
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
        final updateClienteGetClienteByIdResponse = snapshot.data!;
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
              'Atualizar Cliente',
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(
                      'assets/images/tecnico-create.svg',
                      width: double.infinity,
                      height: 10,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                      child: TextFormField(
                        controller: textFieldNomeController ??=
                            TextEditingController(
                          text: GetClienteByIdCall.nome(
                            updateClienteGetClienteByIdResponse.jsonBody,
                          ).toString(),
                        ),
                        onChanged: (_) => EasyDebounce.debounce(
                          'textFieldNomeController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
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
                                  onTap: () async {
                                    textFieldNomeController?.clear();
                                    setState(() {});
                                  },
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
                          text: GetClienteByIdCall.cpf(
                            updateClienteGetClienteByIdResponse.jsonBody,
                          ).toString(),
                        ),
                        onChanged: (_) => EasyDebounce.debounce(
                          'textFieldCpfController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
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
                                  onTap: () async {
                                    textFieldCpfController?.clear();
                                    setState(() {});
                                  },
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
                          text: GetClienteByIdCall.email(
                            updateClienteGetClienteByIdResponse.jsonBody,
                          ).toString(),
                        ),
                        onChanged: (_) => EasyDebounce.debounce(
                          'textFieldEmailController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
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
                                  onTap: () async {
                                    textFieldEmailController?.clear();
                                    setState(() {});
                                  },
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
                          text: GetClienteByIdCall.senha(
                            updateClienteGetClienteByIdResponse.jsonBody,
                          ).toString(),
                        ),
                        obscureText: !textFieldSenhaVisibility,
                        decoration: InputDecoration(
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
                          responsePutCliente = await PutClienteCall.call(
                            token: FFAppState().token,
                            nome: textFieldNomeController?.text ?? '',
                            cpf: textFieldCpfController?.text ?? '',
                            email: textFieldEmailController?.text ?? '',
                            senha: textFieldSenhaController?.text ?? '',
                            id: widget.clienteId,
                          );
                          if ((responsePutCliente?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Salvo Com Sucesso!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).tertiary400,
                              ),
                            );
                            context.pushNamed('ListClientes');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  PutClienteCall.message(
                                    (responsePutCliente?.jsonBody ?? ''),
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
                                  PutClienteCall.fieldNameError(
                                    (responsePutCliente?.jsonBody ?? ''),
                                  ).toString(),
                                  style: TextStyle(
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
          ),
        );
      },
    );
  }
}
