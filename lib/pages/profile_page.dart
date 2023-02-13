import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //! creamos las variables para poder capturar los valores iniciales que se optengan de getData()
  String name = "";
  String address = "";
  String email = "";

  //! en la función de initState hace el llamado de la función que lo contenga al momento de
  //! cargarse la página
  //**--- Hace el llamado a la función getData() para que sea cargado al inicio */
  @override
  void initState() {
    super.initState();
    getData();
  }

  //! función creada para cargar los datos guardados con el proceso de SharedPreferences
  getData() async {
    //! creación de la instancia variable del tipo SharedPreferences para poder acceder a los atributos correspondientes de obtener
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //! si es null se tiene el valor de "No disponible", se agregar doble ?? para condicionar
    //! se hace esto ya que es un string obtenido de un Future, que puede ser null al principio
    // name = prefs.getString("nombre") ?? "No disponible";
    // address = prefs.getString("direccion") ?? "No disponible";
    // email = prefs.getString("correo") ?? "No disponible";
    //! acá hacemos el llamado para obtener el dato guardado en sharedpreferences
    name = SPGlobal().name;
    address = SPGlobal().address;
    email = SPGlobal().email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Mi Perfil",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            Text(
              //** --- variable name creada para la captura del SharedPreferences */
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Nombre completo",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              //** --- variable address creada para la captura del SharedPreferences */
              address,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Dirección",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              //** --- variable email creada para la captura del SharedPreferences */
              email,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Correo Electrónico",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ]),
        ),
      ),
    );
  }
}
