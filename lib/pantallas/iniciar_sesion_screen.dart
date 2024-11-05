import 'dart:convert';

import 'package:app_notas_v2/models/models.dart';
import 'package:app_notas_v2/shared/services/auth_service.dart';
import 'package:app_notas_v2/shared/services/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../widgets/widgets.dart';


class  IniciarSesionScreen extends StatefulWidget {

  const IniciarSesionScreen({super.key});

  @override
  State<IniciarSesionScreen> createState() => _State();
}

class _State extends State<IniciarSesionScreen> {
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Stack(
        children: [
          Fondo(),
          Contenido()
        ],

      ),
    );

  }
}

class Contenido extends StatefulWidget {
  const Contenido({super.key});

  @override
  State<Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {

   @override
  Widget build(BuildContext context) {

    return const Padding(
          padding: EdgeInsets.symmetric( horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Inicio de Sesion',
                    style: TextStyle(
                        color      : Colors.white,
                        fontWeight : FontWeight.bold,
                        fontSize   : 30
                    )),
              SizedBox( height: 5,),
              Text('Bienvenido a tu cuenta',
                   style:  TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 1.5
                   ),),
              SizedBox( height: 5,),
              Datos()
            ],
          )
          );

  }
}


class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade300,
              Colors.blue
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
          )
        ),
    );
  }
}

class Datos extends StatefulWidget {
  const Datos({super.key});
  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {

  setDatosSecureStorage ( String idRol, String nombreUser) async {

    print("set datos");
    await secureStorage.write(key: 'idRol'      , value: idRol);
    await secureStorage.write(key: 'nombreUser' , value: nombreUser);


  }

  bool               obs                    = true;
  Map<String,String> datosLogin             = {};
  bool               confirmarPass          = false;
  String             passConfirmar          = '';
  final FlutterSecureStorage secureStorage  = FlutterSecureStorage();

  final TextEditingController _controllerPass         = TextEditingController();
  final TextEditingController _controlerUser          = TextEditingController();
  final TextEditingController _controlerPassConfirmar = TextEditingController();

  SecureStorageService secureService = SecureStorageService();

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Usuario',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _controlerUser,
                maxLength: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:'Ingrese su Usuario'
                ),
                onChanged: ( value ) => datosLogin['username'] = value,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Contraseña',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   )),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _controllerPass,
                obscureText: obs,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Ingrese su Contraseña',
                  suffixIcon: IconButton(
                    icon: const Icon( Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        obs = !obs;
                      });
                    },
                  )
                ),
                onChanged: ( value ) => datosLogin['password'] = value,
              ),
              if( confirmarPass )
              TextFormField(
                controller: _controlerPassConfirmar,
                obscureText: obs,
                initialValue: datosLogin['passwordConfirmar'],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Confirme su Contraseña',
                  suffixIcon: IconButton(
                    icon: const Icon( Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        obs = !obs;
                      });
                    },
                  ),
                ),
                onChanged: ( value ) => datosLogin['passwordConfirmar'] = value,
              ),
              const SizedBox( height: 20 ),
              Column(
                  children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                  width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {

                        if( !confirmarPass ){
                          if( datosLogin['username'] == null || datosLogin['username']!.isEmpty ){
                            UltisWidget().mostrarMensaje(context, 'Ingrese su Usuario', Colors.orange);
                          }
                          else if( datosLogin['password'] == null || datosLogin['password']!.isEmpty){
                            UltisWidget().mostrarMensaje(context, 'Ingrese su Contraseña', Colors.orange);
                          }
                          else{
                            AuthServices auth    = AuthServices();
                            RespuestaApi rs      = await auth.login(datosLogin);
                            Color colorRespuesta = rs.respuesta == 'success' ? Colors.green : Colors.orange;


                            if( !context.mounted ) return;

                            UltisWidget().mostrarMensaje(context, rs.mensaje, colorRespuesta);

                            if( rs.respuesta == 'success'){

                              var dataUser = jsonDecode(rs.data);
                              context.goNamed('home');
                              setDatosSecureStorage( dataUser['idRol'].toString(),dataUser['nombreUsuario']);

                            }
                            else if( rs.respuesta =='info'){
                              setState(() {
                                confirmarPass = true;
                              });
                            }
                          }
                        }else{
                          if( datosLogin['password'] != datosLogin['passwordConfirmar'] ){
                            UltisWidget().mostrarMensaje(context, 'Las contraseñas deben coincidir', Colors.indigo);
                          }else{

                            AuthServices auth    = AuthServices();
                            RespuestaApi rs      = await auth.setPass(datosLogin);
                            Color colorRespuesta = rs.respuesta == 'success' ? Colors.green : Colors.orange;


                            if( !context.mounted ) return;

                            UltisWidget().mostrarMensaje(context, rs.mensaje, colorRespuesta);

                            if( rs.respuesta == 'success'){
                              setState(() {
                                confirmarPass                   = false;
                                datosLogin['password']          = '';
                                datosLogin['passwordConfirmar'] = '';
                                _controllerPass.clear();
                                _controlerUser.clear();
                                _controlerPassConfirmar.clear();
                              });
                            }

                          }
                        }

                      },
                      style: ButtonStyle(
                        // ignore: deprecated_member_use
                          backgroundColor: MaterialStateProperty.all<Color>( const Color( 0xff142047))
                      ),
                      child: const Text(
                        'Iniciar Sesiòn',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                    const SizedBox(),
                    TextButton(
                        onPressed: (){
                          setState(() {
                            _controllerPass.clear();
                            _controlerUser.clear();
                            _controlerPassConfirmar.clear();
                            context.go('/login/resetPassword');
                          });

                        },
                        child: const Text('¿Olvidaste la contraseña?')
                    )
                ],
              )
            ],
          ),

      );

  }
}








