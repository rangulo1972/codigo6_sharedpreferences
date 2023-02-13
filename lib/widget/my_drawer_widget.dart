import 'package:codigo6_shared/pages/profile_page.dart';
import 'package:codigo6_shared/utils/sp_global.dart';
import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //** ---- inicio de DrawerHeader */
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/11592804/pexels-photo-11592804.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.indigo,
                  radius: 36,
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  //! acá se hace el llamado de name con la ayuda del SPGlobal
                  SPGlobal().name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  //! acá se hace el llamado de email con la ayuda del SPGlobal
                  SPGlobal().email,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          //**--- fin de DrawerHeader  */
          //**------------------------- */
          //**-----inicio del listado de opciones del Drawer */
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Mi Perfil"),
            onTap: () {
              //! con Navigator.pop hacemos que se elimine de memoria la página actual que se tiene, en este caso MyDrawerWidget
              Navigator.pop(context);
              //! con Navigator.pus llamamos a la página profile_page al momento de presionar sobre el campo "Mi Perfil"
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuración"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.price_change),
            title: const Text("Mis Ventas"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text("Resportes"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black87,
            thickness: 0.5,
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Cerrar Sesión"),
          ),
          //** --- fin del listado de opcines del Drawer */
        ],
      ),
    );
  }
}
