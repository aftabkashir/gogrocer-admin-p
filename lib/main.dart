import 'package:flutter/material.dart';
import 'package:go_grocer_admin_panel/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';
import 'controllers/MenuController.dart' as custom;
import 'inner_screens/add_prod.dart';
import 'providers/dark_theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => custom.MenuController(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Grocery',
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home: const MainScreen(),
              routes: {
                UploadProductForm.routeName: (context) =>
                    const UploadProductForm(),
              });
        },
      ),
    );
  }
}
