import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTecnicoWidget extends StatefulWidget {
  const UpdateTecnicoWidget({
    Key? key,
    this.tecnicoId,
    this.perfisSelecionados,
  }) : super(key: key);

  final String? tecnicoId;
  final String? perfisSelecionados;

  @override
  _UpdateTecnicoWidgetState createState() => _UpdateTecnicoWidgetState();
}

class _UpdateTecnicoWidgetState extends State<UpdateTecnicoWidget> {
  ApiCallResponse? responsePutTecnico;
  List<String>? choiceChipsPerfisValues;
  TextEditingController? textFieldNomeController;
  TextEditingController? textFieldCpfController;
  TextEditingController? textFieldEmailController;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  final formKey = GlobalKey<FormState>();
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          'assets/images/tecnico-create.svg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: FlutterFlowChoiceChips(
                            initiallySelected: choiceChipsPerfisValues != null
                                ? choiceChipsPerfisValues
                                : functions
                                    .jsonToList(GetTecnicoByIdCall.perfis(
                                    updateTecnicoGetTecnicoByIdResponse
                                        .jsonBody,
                                  )),
                            options: FFAppState()
                                .perfisList
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsPerfisValues = val),
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              iconColor: Color(0xFFE3E7ED),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: true,
                            initialized: choiceChipsPerfisValues != null,
                            alignment: WrapAlignment.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                              labelText: 'Nome',
                              hintText: 'Digite o Nome',
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
                              suffixIcon:
                                  textFieldNomeController!.text.isNotEmpty
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.start,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 3) {
                                return 'Requires at least 3 characters.';
                              }
                              if (val.length > 50) {
                                return 'Maximum 50 characters allowed, currently ${val.length}.';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                              labelText: 'CPF',
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
                              suffixIcon:
                                  textFieldCpfController!.text.isNotEmpty
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 11) {
                                return 'Requires at least 11 characters.';
                              }
                              if (val.length > 11) {
                                return 'Maximum 11 characters allowed, currently ${val.length}.';
                              }

                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
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
                              labelText: 'Email',
                              hintText: 'Digite um Email Válido...',
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
                              suffixIcon:
                                  textFieldEmailController!.text.isNotEmpty
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }

                              if (!RegExp(kTextValidatorEmailRegex)
                                  .hasMatch(val)) {
                                return 'Has to be a valid email address.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: TextFormField(
                            controller: textFieldSenhaController ??=
                                TextEditingController(
                              text: GetTecnicoByIdCall.senha(
                                updateTecnicoGetTecnicoByIdResponse.jsonBody,
                              ).toString(),
                            ),
                            obscureText: !textFieldSenhaVisibility,
                            decoration: InputDecoration(
                              labelText: 'Senha',
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }
                              if (val.length < 3) {
                                return 'Requires at least 3 characters.';
                              }
                              if (val.length > 60) {
                                return 'Maximum 60 characters allowed, currently ${val.length}.';
                              }

                              return null;
                            },
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

                              responsePutTecnico = await PutTecnicoCall.call(
                                token: FFAppState().token,
                                id: widget.tecnicoId,
                                nome: textFieldNomeController?.text ?? '',
                                cpf: textFieldCpfController?.text ?? '',
                                email: textFieldEmailController?.text ?? '',
                                senha: textFieldSenhaController?.text ?? '',
                                perfisFf: functions.listToString(
                                    choiceChipsPerfisValues!.toList()),
                              );
                              if ((responsePutTecnico?.succeeded ?? true)) {
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
                                        FlutterFlowTheme.of(context)
                                            .tertiary400,
                                  ),
                                );
                                context.pushNamed('ListTecnicos');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      PutTecnicoCall.message(
                                        (responsePutTecnico?.jsonBody ?? ''),
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
                                      PutTecnicoCall.fieldNameError(
                                        (responsePutTecnico?.jsonBody ?? ''),
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
          ),
        );
      },
    );
  }
}
