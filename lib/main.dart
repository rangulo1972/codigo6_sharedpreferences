import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';
import 'package:codigo6_shared/pages/home_page.dart';

void main() async {
  //! método que se debe crear para asegurar la inicialización de objetos del tipo SharedPrefences
  WidgetsFlutterBinding.ensureInitialized();
  //! acá inicilizamos el SharedPreferences para todo el aplicativo
  SPGlobal spGlobal = SPGlobal();
  await spGlobal.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
