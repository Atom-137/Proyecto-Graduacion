import 'package:app_notas_v2/providers/providers.dart';
import 'package:app_notas_v2/shared/services/catalogos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'widgets.dart';

class FormDynamicWidget extends StatefulWidget {
  final Map<String, dynamic> formAux;

  const FormDynamicWidget(this.formAux, {super.key});

  @override
  State<FormDynamicWidget> createState() => _FormDynamicWidgetState();
}

class _FormDynamicWidgetState extends State<FormDynamicWidget> {
  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormdynamicProvider>(context);
    final FormDynamic formularioAux = FormDynamic.fromJson(widget.formAux);
    final CatalogosService catalogos = CatalogosService();

    formProvider.crearForm(hashForm: formularioAux.hash);

    return Form(
        child: Column(
            children: formularioAux.lstCampos
                .map<Widget>((ElementformModel elementoForm) {
      if (elementoForm.tipoEleForm == 'texto') {
        return Column(children: [
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) => formProvider.asignarControlador(
                hashForm: formularioAux.hash,
                campo: elementoForm.name,
                valor: value),
            decoration: InputDecoration(
                hintText: elementoForm.hintText, labelText: elementoForm.label),
            keyboardType: elementoForm.keyboarType,
            maxLength: elementoForm.maxLength,
          )
        ]);
      } else if (elementoForm.tipoEleForm == 'dropdown') {
        if (formularioAux.hash == 'registrarEstudiante') {
          return FutureBuilder(
            future: catalogos.catalogoGrados(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(children: [
                  const SizedBox(height: 20),
                  const Text('Grado y Seccion '),
                  DropdownButtonFormField<String>(
                      items: snapshot.data!.map((itemForm) {
                        return DropdownMenuItem(
                            value: itemForm['idGrado'].toString(),
                            child: Text(itemForm['nombreGrado']));
                      }).toList(),
                      onChanged: (value) {
                        formProvider.asignarControlador(
                            hashForm: formularioAux.hash,
                            campo: elementoForm.name,
                            valor: value);
                      })
                ]);
              } else {
                return const Text('Cargando info...');
              }
            },
          );
        } else if (formularioAux.hash == 'registroGrados') {
          return FutureBuilder(
            future: catalogos.catalogoSecciones(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(children: [
                  const SizedBox(height: 20),
                  const Text('Seccion '),
                  DropdownButtonFormField<String>(
                      items: snapshot.data!.map((itemForm) {
                        return DropdownMenuItem(
                            value: itemForm['idSeccionGrado'].toString(),
                            child: Text(itemForm['seccion']));
                      }).toList(),
                      onChanged: (value) {
                        formProvider.asignarControlador(
                            hashForm: formularioAux.hash,
                            campo: elementoForm.name,
                            valor: value);
                      })
                ]);
              } else {
                return const Text('Cargando info...');
              }
            },
          );
        } else if (formularioAux.hash == 'registroCurso') {
          if (elementoForm.name == 'maestro') {
            return FutureBuilder(
              future: catalogos.catalogoMaestros(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text('Maestro Encargado'),
                      DropdownButtonFormField<String>(
                          items: snapshot.data!.map((itemForm) {
                            return DropdownMenuItem(
                                value: itemForm['idMaestro'].toString(),
                                child: SizedBox(
                                    width: 300,
                                    child: Text(itemForm['nombreMaestro'])));
                          }).toList(),
                          onChanged: (value) {
                            formProvider.asignarControlador(
                                hashForm: formularioAux.hash,
                                campo: elementoForm.name,
                                valor: value);
                          })
                    ],
                  );
                } else {
                  return const Text('Cargando info...');
                }
              },
            );
          } else if (elementoForm.name == 'grado') {
            return FutureBuilder(
              future: catalogos.catalogoGrados(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(children: [
                    const SizedBox(height: 20),
                    const Text('Grado y Seccion '),
                    DropdownButtonFormField<String>(
                        items: snapshot.data!.map((itemForm) {
                          return DropdownMenuItem(
                              value: itemForm['idGrado'].toString(),
                              child: Text(itemForm['nombreGrado']));
                        }).toList(),
                        onChanged: (value) {
                          formProvider.asignarControlador(
                              hashForm: formularioAux.hash,
                              campo: elementoForm.name,
                              valor: value);
                        })
                  ]);
                } else {
                  return const Text('Cargando info...');
                }
              },
            );
          } else {
            return const Text('No se cargaron los datos de maestros y grados');
          }
        } else if (formularioAux.hash == 'registroCalificacion') {
          if (elementoForm.name == 'curso') {
            return FutureBuilder(
              future: catalogos.catalogoCursos(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(children: [
                    const SizedBox(height: 20),
                    const Text('Seleccione el Curso'),
                    DropdownButtonFormField<String>(
                        items: snapshot.data!.map((itemForm) {
                          return DropdownMenuItem(
                              value: itemForm['idCurso'].toString(),
                              child: Text(itemForm['gradoSeccion']));
                        }).toList(),
                        onChanged: (value) {
                          formProvider.asignarControlador(
                              hashForm: formularioAux.hash,
                              campo: elementoForm.name,
                              valor: value);
                        })
                  ]);
                } else {
                  return const Text('Cargando info...');
                }
              },
            );
          } else if (elementoForm.name == 'estudiante') {
            return FutureBuilder(
              future: catalogos.catalogoEstudiante(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(children: [
                    const SizedBox(height: 20),
                    const Text('Seleccione el Estudiante'),
                    DropdownButtonFormField<String>(
                        items: snapshot.data!.map((itemForm) {
                          return DropdownMenuItem(
                              value: itemForm['idEstudiante'].toString(),
                              child: SizedBox(
                                      width: 300,
                                      child: Text(itemForm['nomEstudiante'])
                              )
                          );
                        }).toList(),
                        onChanged: (value) {
                          formProvider.asignarControlador(
                              hashForm: formularioAux.hash,
                              campo: elementoForm.name,
                              valor: value);
                        })
                  ]);
                } else {
                  return const Text('Cargando info...');
                }
              },
            );
          }
          else if (elementoForm.name == 'bimestre') {
            return FutureBuilder(
              future: catalogos.catalogoBimestres(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Column(children: [
                    const SizedBox(height: 20),
                    const Text('Seleccione el Bimestre'),
                    DropdownButtonFormField<String>(
                        items: snapshot.data!.map((itemForm) {
                          return DropdownMenuItem(
                               value: itemForm['idBimestre'].toString(),
                              child: SizedBox(
                                  width: 300,
                                  child: Text(itemForm['bimestre'])
                              )
                          );
                        }).toList(),
                        onChanged: (value) {
                          formProvider.asignarControlador(
                              hashForm: formularioAux.hash,
                              campo: elementoForm.name,
                              valor: value);
                        })
                  ]);
                } else {
                  return const Text('Cargando info...');
                }
              },
            );
          }

          else {
            return const Text('No se cargaron los datos de los cursos');
          }
        } else {
          return const Text('No existe el catalogo de dropdown');
        }
      } else if (elementoForm.tipoEleForm == 'checkbox') {
        return Column(children: [
          const SizedBox(height: 20),
          CheckBoxDynamicWidget(
              labelCheckbox: elementoForm.label,
              hash: formularioAux.hash,
              campo: elementoForm.name)
        ]);
      } else if (elementoForm.tipoEleForm == 'radioButton') {
        final lstCampos = ['Opcion 1', 'Opcion 2', 'Opcion 3'];

        return Column(children: [
          const SizedBox(height: 20),
          RadioButtonDynamicWidget(
              label: elementoForm.label,
              hash: formularioAux.hash,
              campo: elementoForm.name,
              lstDatos: lstCampos)
        ]);
      } else if (elementoForm.tipoEleForm == 'slider') {
        return Column(children: [
          const SizedBox(height: 20),
          SliderFormDynamicWidget(
              label: elementoForm.label,
              hash: formularioAux.hash,
              campo: elementoForm.name)
        ]);
      } else if (elementoForm.tipoEleForm == 'fecha') {
        return Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Seleccionar fecha'),
              onPressed: () async {
                DateTime? fechas = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                formProvider.asignarControlador(
                    hashForm: formularioAux.hash,
                    campo: elementoForm.name,
                    valor: fechas);
              },
            ),
          ],
        );
      } else if (elementoForm.tipoEleForm == 'hora') {
        return Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Seleccionar hora'),
              onPressed: () async {
                TimeOfDay? hora = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                formProvider.asignarControlador(
                    hashForm: formularioAux.hash,
                    campo: elementoForm.name,
                    valor: hora);
              },
            ),
          ],
        );
      } else if (elementoForm.tipoEleForm == 'botonGuardar') {
        return Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                elementoForm.callback!();
              },
              child: Text(elementoForm.label),
            ),
          ],
        );
      } else {
        return const Text('Campos formulario no validos');
      }
    }).toList()));
  }
}
