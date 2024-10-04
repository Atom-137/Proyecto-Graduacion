import 'package:app_notas_v2/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'widgets.dart';

class FormDynamicWidget extends StatefulWidget {

  final Map<String, dynamic> formAux;

  const FormDynamicWidget( this.formAux, {super.key});

  @override
  State<FormDynamicWidget> createState() => _FormDynamicWidgetState();
}

class _FormDynamicWidgetState extends State<FormDynamicWidget> {

  @override
  Widget build(BuildContext context) {

    final formProvider                      = Provider.of<FormdynamicProvider>(context);
    final FormDynamic formularioAux         = FormDynamic.fromJson( widget.formAux ) ;

    formProvider.crearForm(hashForm: formularioAux.hash);

    return Form(
        child : Column(
            children: formularioAux.lstCampos.map<Widget>((ElementformModel elementoForm){
                              if( elementoForm.tipoEleForm == 'texto'){
                                return Column( children: [
                                    const SizedBox( height:  20),
                                    TextFormField( onChanged  : (value) => formProvider.asignarControlador( hashForm : formularioAux.hash,
                                                                                                            campo    : elementoForm.name,
                                                                                                            valor    : value),
                                                   decoration : InputDecoration( hintText  : elementoForm.hintText,
                                                                                 labelText : elementoForm.label),
                                                   keyboardType : elementoForm.keyboarType,
                                                   maxLength    : elementoForm.maxLength,
                                    )
                                ]);
                              }
                              else if( elementoForm.tipoEleForm == 'dropdown'){
                                return Column(
                                  children:[  const SizedBox( height: 20),
                                              DropdownButtonFormField<String>(
                                                  items: ['Masculino', 'Femenino']
                                                             .map((label) => DropdownMenuItem( value: label,
                                                                                               child: Text(label)
                                                                                             )).toList(),
                                                  onChanged: (value) {
                                                    formProvider.asignarControlador( hashForm : formularioAux.hash,
                                                        campo    : elementoForm.name,
                                                        valor    : value);
                                                  }
                                                )
                                  ]
                                );

                              }else if ( elementoForm.tipoEleForm == 'checkbox'){
                                return Column(
                                    children: [
                                      const SizedBox( height:  20 ),
                                      CheckBoxDynamicWidget( labelCheckbox  : elementoForm.label,
                                                                   hash           : formularioAux.hash,
                                                                   campo          : elementoForm.name)
                                ]);
                              }else if( elementoForm.tipoEleForm == 'radioButton'){

                                  final lstCampos = ['Opcion 1', 'Opcion 2', 'Opcion 3 xd'];

                                  return Column(
                                      children : [
                                        const SizedBox( height: 20 ),
                                        RadioButtonDynamicWidget( label    : elementoForm.label,
                                                                       hash     : formularioAux.hash,
                                                                       campo    : elementoForm.name,
                                                                       lstDatos : lstCampos)]);

                              }else if( elementoForm.tipoEleForm == 'slider'){

                                  return Column(
                                    children: [
                                      const SizedBox( height: 20 ),
                                      SliderFormDynamicWidget( label  : elementoForm.label,
                                                                hash  : formularioAux.hash,
                                                                campo : elementoForm.name)
                                  ]);

                              }else if ( elementoForm.tipoEleForm == 'fecha'){
                                return Column(
                                  children: [
                                    const SizedBox( height: 20 ),
                                    ElevatedButton(
                                      child: const Text('Seleccionar fecha'),
                                      onPressed: () async {
                                        DateTime? fechas = await showDatePicker(
                                          context     : context,
                                          initialDate : DateTime.now(),
                                          firstDate   : DateTime(2000),
                                          lastDate    : DateTime(2101)
                                        );

                                        formProvider.asignarControlador( hashForm : formularioAux.hash,
                                                                         campo    : elementoForm.name,
                                                                         valor    : fechas);
                                      },
                                    ),
                                  ],
                                );
                              }else if ( elementoForm.tipoEleForm  == 'hora'){
                                return Column(
                                  children: [
                                    const SizedBox( height: 20 ),
                                    ElevatedButton(
                                      child: const Text('Seleccionar hora'),
                                      onPressed: () async {
                                        TimeOfDay? hora = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );

                                        formProvider.asignarControlador( hashForm : formularioAux.hash,
                                                                         campo    : elementoForm.name,
                                                                         valor    : hora);
                                      },
                                    ),
                                  ],
                                );
                              }
                              else if( elementoForm.tipoEleForm == 'botonGuardar'){
                                  return Column(
                                    children: [
                                      const SizedBox( height:  20 ),
                                      ElevatedButton(
                                        onPressed: () {
                                           elementoForm.callback!();
                                        },
                                        child: Text(elementoForm.label),
                                      ),
                                    ],
                                  );
                              }
                              else{
                                return const Text('Campos formulario no validos');
                              }

                          }
                        ).toList()
        )
    );
  }
}

