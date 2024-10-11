import 'package:flutter/material.dart';


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

  bool  obs = true;

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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:'Ingrese su Usuario'
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Contraseña',
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                   ),),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
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
              ),
              const Remember(),
              const SizedBox(),
              const Botones()
            ],
          ),

      );

  }
}


class Remember extends StatefulWidget {
  const Remember({super.key});

  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  @override
  Widget build(BuildContext context) {

    bool valor = false;

    return Row(
      children: [
        Checkbox(value: valor,
                 onChanged: (valor) {
                   setState(() {
                     valor = !valor!;
                   });
                 }
        ),
        const Text('Recordarme'),
        const Spacer(),
        TextButton(
          onPressed: (){},
          child: const Text('¿Olvidaste la contraseña?')
        )
      ],
    );
  }
}


class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: (){},
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
      ],
    );

  }
}








