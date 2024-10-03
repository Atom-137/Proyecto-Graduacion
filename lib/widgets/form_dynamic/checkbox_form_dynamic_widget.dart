import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/providers.dart';
import '../../models/models.dart';

class CheckBoxDynamicWidget extends StatefulWidget {

  final String labelCheckbox;
  final String hash;
  final String campo;

  const CheckBoxDynamicWidget({super.key,  required this.labelCheckbox, required this.hash, required this.campo });

  @override
  State<CheckBoxDynamicWidget> createState() => _CheckBoxDynamicWidget();
}

class _CheckBoxDynamicWidget extends State<CheckBoxDynamicWidget> {

  final CheckboxModel checkBox = CheckboxModel(label: '', isChecked: false);

  @override
  Widget build(BuildContext context) {

    final formProvider = Provider.of<FormdynamicProvider>(context);
    checkBox.label     = widget.labelCheckbox;

    return CheckboxListTile(
      title     : Text(checkBox.label),
      value     : checkBox.isChecked,
      onChanged : (bool? value) {

        setState(() {
          checkBox.isChecked = value!;
          formProvider.asignarControlador( hashForm : widget.hash,
              campo    : widget.campo,
              valor    : value);
        });
      },
    );
  }
}