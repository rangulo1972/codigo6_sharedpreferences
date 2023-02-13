import 'package:shared_preferences/shared_preferences.dart'; //! importación de la libreria para sharedPreferences

//! clase que va manejar el SharedPreferences
class SPGlobal {
  // static int age = 20;

  // static void getAge() {
  //   print("Holaaa!!!");
  // }
  //! hacemos uso de singleton
  //! haciendo static a la instancia, podemos acceder a dicha instancia sin necesidad de instanciar otro objeto de
  //! dicha clase
  static final SPGlobal _instance = SPGlobal.datos();
  //! constructor de la clase SPGlobal con nombre data
  SPGlobal.datos();

  //! palabra clave relacionado a un tipo de constructor
  //! da la potestad de devolver un objeto del mismo tipo
  //! con la palabra "factory" podemos exportar a la clase SPGlobal para ser usadp en todo el programa
  factory SPGlobal() {
    return _instance;
  }

  // int age = 20;

  //! con "late" indicamos que el objeto será inicializado después
  late SharedPreferences prefs;

  //! método asíncrono para inicializar el SharedPreferences
  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  //! creamos los métodos de sharedpreferences para se ejecutados en el aplicativo
  //**--- método para guardar el campo "name" */
  set name(String value) {
    prefs.setString("name", value);
  }

  //** ---- método para obtener el campo "name" */
  String get name {
    return prefs.getString("name") ?? "--";
  }

  //**--- método para guardar el campo "address" */
  set address(String value) {
    prefs.setString("address", value);
  }

  //** ---- método para obtener el campo "address" */
  String get address {
    return prefs.getString("address") ?? "--";
  }

  //**--- método para guardar el campo "email" */
  set email(String value) {
    prefs.setString("email", value);
  }

  //** ---- método para obtener el campo "email" */
  String get email {
    return prefs.getString("email") ?? "--";
  }
}
