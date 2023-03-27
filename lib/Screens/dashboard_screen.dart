import 'package:flutter/material.dart';
import 'package:socialtec/Screens/Post/list_post.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SOCIALTEC')),
      ),
      body: ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        label: Text('Add post'),
        icon: const Icon(Icons.add_comment),
      ),
      //body: ,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Jesus Pichardo'),
              accountEmail: Text('alepbuenrostro20@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2021/10/spider-man-sin-camino-a-casa.jpg?fit=1200%2C766&quality=55&strip=all&ssl=1'),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/fondos/pexels-simon-berger-1323550.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 12),
            ListTile(
              onTap: () {},
              title: const Text('Inicio'),
              leading: const Icon(Icons.home),
            ),
            const SizedBox(height: 16),
            ListTile(
              onTap: () {},
              title: const Text('Perfil'),
              leading: const Icon(Icons.account_circle),
            ),
            const SizedBox(height: 16),
            ListTile(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  Navigator.pushNamed(context, '/events');
                });
              },
              title: const Text('Eventos'),
              leading: const Icon(Icons.calendar_month),
            ),
            const SizedBox(height: 16),
            ListTile(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  Navigator.pushNamed(context, '/preferences');
                });
              },
              title: const Text('Configuracion'),
              leading: const Icon(Icons.settings),
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            ListTile(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  Navigator.pushNamed(context, '/welcome');
                });
              },
              title: const Text('Cerrar sesion'),
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
