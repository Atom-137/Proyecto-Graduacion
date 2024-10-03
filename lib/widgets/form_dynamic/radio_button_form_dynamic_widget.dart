import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';


class RadioButtonDynamicWidget extends StatefulWidget {

  final String campo;
  final String hash;
  final String label;
  final List<String> lstDatos;

  const RadioButtonDynamicWidget({ required this.campo,
    required this.hash,
    required this.label,
    required this.lstDatos,
    super.key
  });

  @override
  State<RadioButtonDynamicWidget> createState() => _RadioButtonDynamicWidget();
}

class _RadioButtonDynamicWidget extends State<RadioButtonDynamicWidget> {

  String? _selectedOption;

  @override
  Widget build(BuildContext context) {

    final List<String> _lstDatos = widget.lstDatos;
    final formProvider = Provider.of<FormdynamicProvider>(context);

    return Column(
      children: [
        ..._lstDatos.map((option) =>
            RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;

                  formProvider.asignarControlador( hashForm : widget.hash,
                      campo    : widget.campo,
                      valor    : value);
                });
              },
            )),
      ],
    );
  }
}