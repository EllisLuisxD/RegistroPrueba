import 'package:flutter/material.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  List<MenusdelDia> menus = [
    MenusdelDia(urlImagen: 'ceviche.jpg', nombrePlato: 'Ceviche', precio: 20),
    MenusdelDia(
        urlImagen: 'lomo_saltado.jpg', nombrePlato: 'Lomo Saltado', precio: 30),
    MenusdelDia(
        urlImagen: 'aji_de_gallina.jpg',
        nombrePlato: 'Ají de Gallina',
        precio: 18),
    MenusdelDia(
        urlImagen: 'arroz_con_pollo.jpg',
        nombrePlato: 'Arroz con Pollo',
        precio: 19)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Menú',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: menus.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: Card(
                color: Colors.grey[200],
                elevation: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 0,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10.0)),
                          child: Container(
                            height: 140,
                            child: Image.asset(
                              'assets/img/${menus[index].urlImagen}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${menus[index].nombrePlato}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Precio: S/ ${menus[index].precio}'),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  print(
                                      'Plato ${menus[index]}:\nNombre: ${menus[index].nombrePlato}\nPrecio: S/ ${menus[index].precio}\nImagen: ${menus[index].urlImagen}');
                                });
                              },
                              child: Text(
                                'Comprar',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class MenusdelDia {
  String urlImagen;
  String nombrePlato;
  int precio;

  MenusdelDia(
      {required this.urlImagen,
      required this.nombrePlato,
      required this.precio});
}
