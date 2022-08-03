import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  FFAppState(); // Initialize FFAppState

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);

    Future.delayed(Duration(seconds: 1),
        () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HelpDesk Flutter',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage}) : super(key: key);

  final String? initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Home';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'ListagemTecnicos': ListagemTecnicosWidget(),
      'GetTecnicoById': GetTecnicoByIdWidget(),
      'send': SendWidget(),
      'receive': ReceiveWidget(),
      'CreateTecnico': CreateTecnicoWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.black,
        color: Color(0x8A000000),
        activeColor: FlutterFlowTheme.of(context).primaryColor,
        tabBackgroundColor: Color(0x00000000),
        tabBorderRadius: 100,
        tabMargin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        gap: 0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: Duration(milliseconds: 500),
        haptic: false,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          ),
          GButton(
            icon: currentIndex == 1 ? Icons.home : Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          ),
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
            iconSize: 24,
          )
        ],
      ),
    );
  }
}
