import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
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

class CreateTecnicoWidget extends StatefulWidget {
  const CreateTecnicoWidget({
    Key? key,
    this.tecnicoId,
  }) : super(key: key);

  final String? tecnicoId;

  @override
  _CreateTecnicoWidgetState createState() => _CreateTecnicoWidgetState();
}

class _CreateTecnicoWidgetState extends State<CreateTecnicoWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? responseCreateTecnico;
  List<String>? choiceChipsPerfisValues;
  TextEditingController? textFieldNomeController;
  TextEditingController? textFieldCpfController;
  TextEditingController? textFieldEmailController;
  TextEditingController? textFieldSenhaController;
  late bool textFieldSenhaVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textFieldCpfController = TextEditingController();
    textFieldNomeController = TextEditingController();
    textFieldEmailController = TextEditingController();
    textFieldSenhaController = TextEditingController();
    textFieldSenhaVisibility = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        final createTecnicoGetTecnicoByIdResponse = snapshot.data!;
        return Title(
            title: 'CreateTecnico',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
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
                  'Cadastrar Técnico',
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
                        children: [
                          SvgPicture.asset(
                            'assets/images/tecnico-create.svg',
                            width: double.infinity,
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: FlutterFlowChoiceChips(
                              initiallySelected: choiceChipsPerfisValues != null
                                  ? choiceChipsPerfisValues
                                  : [],
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                            child: TextFormField(
                              controller: textFieldNomeController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldNomeController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                hintText: 'Digite o Nome...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
                                if (val.length > 20) {
                                  return 'Maximum 20 characters allowed, currently ${val.length}.';
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                            child: TextFormField(
                              controller: textFieldCpfController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldCpfController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'CPF',
                                hintText: 'Digite o CPF...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                            child: TextFormField(
                              controller: textFieldEmailController,
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }
                                if (val.length < 8) {
                                  return 'Requires at least 8 characters.';
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 15, 12, 0),
                            child: TextFormField(
                              controller: textFieldSenhaController,
                              obscureText: !textFieldSenhaVisibility,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                hintText: 'Digite a Senha...',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (formKey.currentState == null ||
                                    !formKey.currentState!.validate()) {
                                  return;
                                }

                                responseCreateTecnico =
                                    await PostTecnicoCall.call(
                                  token: FFAppState().token,
                                  nome: textFieldNomeController!.text,
                                  cpf: textFieldCpfController!.text,
                                  email: textFieldEmailController!.text,
                                  senha: textFieldSenhaController!.text,
                                  apiUrl: FFAppState().apiUrl,
                                  perfisFf: valueOrDefault<String>(
                                    functions.listToString(
                                        choiceChipsPerfisValues!.toList()),
                                    'ND',
                                  ),
                                );
                                if ((responseCreateTecnico?.succeeded ??
                                    true)) {
                                  context.pushNamed('ListTecnicos');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Salvo com Sucesso!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    textFieldSenhaController?.clear();
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        PostTecnicoCall.message(
                                          (responseCreateTecnico?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        PostTecnicoCall.fieldNameError(
                                          (responseCreateTecnico?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                              text: 'Cadastrar\n',
                              icon: Icon(
                                Icons.create,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 150,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                  ).animated([animationsMap['containerOnPageLoadAnimation']!]),
                ),
              ),
            ));
      },
    );
  }
}
