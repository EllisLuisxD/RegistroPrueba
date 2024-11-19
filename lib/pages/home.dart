import 'package:flutter/material.dart';
import 'package:registro_formfield/pages/registro.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> usuarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.blue,
      ),
      body: usuarios.isEmpty
          ? Center(
              child: Text('NO HAY USUARIOS, REGISTRE UNO'),
            )
          : Center(
              child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Colors.black)),
                      child: Container(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/img/${usuarios[index].country}.png'),
                              radius: 35,
                            ),
                            Text(
                              '${usuarios[index].userName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.credit_card),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${usuarios[index].dni}'),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${usuarios[index].phone}')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic nuevoUsuario =
              await Navigator.pushNamed(context, '/registro');
          if (nuevoUsuario != null) {
            setState(() {
              usuarios.add(nuevoUsuario);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
