import 'package:app_notas_v2/providers/form_providers/formDynamic_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderFormDynamicWidget extends StatefulWidget {

  final String campo;
  final String hash;
  final String label;

  const SliderFormDynamicWidget({super.key,
    required this.campo,
    required this.hash,
    required this.label});

  @override
  State<SliderFormDynamicWidget> createState() => _SliderFormDynamicWidgetState();
}

class _SliderFormDynamicWidgetState extends State<SliderFormDynamicWidget> {

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {

    final formProvider = Provider.of<FormdynamicProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 10,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;

              formProvider.asignarControlador( hashForm : widget.hash,
                  campo     : widget.campo,
                  valor     : value);

            });
          },
        ),
        SizedBox(height: 20),
        Text(
          'Valor del Slider: ${_currentSliderValue.round()}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

