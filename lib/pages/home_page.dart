import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';
import 'package:codigo6_shared/widget/my_drawer_widget.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nombre = "";
  String _email = "";
  String name = "";
  int edad = 0;
  //**-------------------------------------------------------------------- */
  //! Para poder realizar las capturas cuando se trabaja con el TextField
  //! acá se crean los TextEditingController para los campos que se van a trabajar
  //! se debe de crear uno por cada campo o variable que se va a atrabajar
  //**--- TextEditingController para el campo nombre */
  final TextEditingController _nameController = TextEditingController();
  //**--- TextEditingController para el campo dirección */
  final TextEditingController _addressController = TextEditingController();
  //**--- TextEditingController para el campo email */
  final TextEditingController _emailController = TextEditingController();

  //! debemos extraer el contenido del future que tiene SharedPreferences.getInstance()
  Future<void> guardar() async {
    //! creación de la instancia variable del tipo SharedPreferences para poder acceder a los atributos correspondientes de guardar
    // SharedPreferences variable = await SharedPreferences.getInstance();
    //! acá se colocan los TextEditingController creados para guardar los datos leidos de los TextField
    //! se pone uno por cada TextField creado para ser guardado
    // variable.setString("nombre", _nameController.text);
    // variable.setString("direccion", _addressController.text);
    // variable.setString("correo", _emailController.text);
    //!------------------------------------------------------------
    // variable.setInt("edad", 40);
    // print(SPGlobal.age);
    // SPGlobal.getAge();
    // print(SPGlobal().age);
    //! acá pasamos los valores  de sharedpreferences para ser guardados en el equipo
    SPGlobal().name = _nameController.text;
    SPGlobal().address = _addressController.text;
    SPGlobal().email = _emailController.text;
  }

  //! ambas instancias son diferentes, ya que están declaradas dentro de cada función en particular
  Future<void> obtener() async {
    SharedPreferences variable = await SharedPreferences.getInstance();
    variable.getString("nombre");
    name = variable.getString("nombre") ??
        "--"; //! si es null se tiene el valor de "No name", se agregar doble ?? para condicionar
    variable.getInt("edad");
    edad = variable.getInt("edad") ?? 0;
    // print(variable.getString("nombre"));
    // print(variable.getInt("edad"));
    setState(() {});
  }

  //! Función Future que retorna un String
  Future<String> getName() async {
    SharedPreferences variable = await SharedPreferences.getInstance();
    return variable.getString("nombre") ?? "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shared Preferences"),
      ),
      //! menú lateral llamado Drawer
      drawer: MyDrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //** --- incio de los campos para llenar la info y ser guardado */
                TextField(
                    //! en la propiedad controller se asigna el TextEditingController
                    controller: _nameController,
                    // //! haciendo uso de expresiones regulares para que solo deje poner letras
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp("[A-Za-z]"))
                    // ],
                    //** En decoration se usa para poder colocar lo que se verá al momento de presentarse el campo a llenar */
                    decoration:
                        const InputDecoration(hintText: "Nombre completo")),
                const SizedBox(height: 10),
                TextField(
                    //! en la propiedad controller se asigna el TextEditingController
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: "Dirección")),
                const SizedBox(height: 10),
                TextField(
                  //! en la propiedad controller se asigna el TextEditingController
                  controller: _emailController,
                  decoration:
                      const InputDecoration(hintText: "Correo electrónico"),
                ),
                //**----- fin de los campos para llenar la info y ser guardado */
                const SizedBox(
                  height: 12,
                ),
                //**--- incio del button para guardar */
                ElevatedButton(
                  onPressed: () {
                    guardar();
                  },
                  child: const Text("Guardar"),
                ),
                //**---fin del button para guaradar */
                // ElevatedButton(
                //   onPressed: () {
                //     obtener();
                //   },
                //   child: Text("Obtener"),
                // ),
                // Text(name),
                // Text(edad.toString()),
                // Divider(
                //   thickness: 1,
                //   color: Colors.black87,
                // ),
                // FutureBuilder(
                //   future: getName(),
                //   builder: (BuildContext context, AsyncSnapshot snap) {
                //     if (snap.hasData) {
                //       return Text(snap.data);
                //     }
                //     return CircularProgressIndicator();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
