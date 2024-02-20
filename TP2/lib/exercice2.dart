import 'package:flutter/material.dart';

double pi = 3.1415;

class ChangeImageParameters extends StatefulWidget {
  const ChangeImageParameters({super.key});
  @override
  State<ChangeImageParameters> createState() => _Exercise2PageState();
}

class _Exercise2PageState extends State<ChangeImageParameters> {
  double _rotationSliderValue = 10;
  double _zoomingSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 2'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Transform.rotate(
              angle:_rotationSliderValue*2*pi/100,
              child: Image(
                width: _zoomingSliderValue*4,
                image: const NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ),
            const SizedBox(height: 50,),
            rotationSlider(),
            zoomingSlider()
          ],
        )
      ),
    );
  }

  Row rotationSlider() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text("Rotation :"),
        ),
        Slider(
          value: _rotationSliderValue,
          max: 100,
          onChanged: (double value) {
            setState(() {
              _rotationSliderValue = value;
            });
          },
        ),
      ],
    );
  }

  Row zoomingSlider() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text("Zoom :"),
        ),
        Slider(
          value: _zoomingSliderValue,
          max: 100,
          onChanged: (double value) {
            setState(() {
              _zoomingSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}