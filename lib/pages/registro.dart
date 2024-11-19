import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  //Para obtener los datos de cada campo, menos el de lista desplegable
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //Creamos un key para obtener el estado de todo el formulario y luego validar y guardar.
  final _key = GlobalKey<FormState>();

  //Iniciamos una variable de tipo string para los valores de cada seleccion de la lista desplegable.
  String? firstValue;

  bool mostrar = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    passwordController.dispose();
    dniController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Usuario'),
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Registre un usuario';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text('Nombre de Usuario'),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: mostrar,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese una contraseña';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              mostrar = !mostrar;
                            });
                          },
                          icon: mostrar
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined)),
                      label: Text('Crea una contraseña'),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: dniController,
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No ha ingresado su DNI';
                    }
                    if (value.length < 8) {
                      return 'El dni es de 8 dígitos';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.credit_card),
                      label: Text('Ingrese su DNI'),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 280,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 9,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No ha ingresado su celular';
                    }
                    if (value.length < 9) {
                      return 'Debe contener 9 dígitos';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android_outlined),
                      label: Text('Ingrese su celular'),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                width: 280,
                child: DropdownButtonFormField(
                  hint: Text('Escoge tu país'),
                  value: firstValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No has escogido tu país';
                    }
                    return null;
                  },
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  items: paises.map(
                    (pais) {
                      return DropdownMenuItem(
                        child: Text('$pais'),
                        value: '$pais',
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      firstValue = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Usuario Registrado Correctamente')));

                    _key.currentState!.save();

                    final nuevoUsuario = User(
                        userName: '${userController.text}',
                        password: '${passwordController.text}',
                        dni: '${dniController.text}',
                        phone: '${phoneController.text}',
                        country: '$firstValue');

                    Navigator.pop(context, nuevoUsuario);
                  }
                },
                child: Text('Registrar'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  String? userName;
  String? password;
  String? dni;
  String? phone;
  String? country;

  User({this.userName, this.password, this.dni, this.phone, this.country});
}

List<String> paises = [
  'alemania',
  'argentina',
  'brasil',
  'españa',
  'francia',
  'inglaterra',
  'peru',
  'uruguay',
  'usa'
];
