import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BasalEnergyCalculator(),
  ));
}

class BasalEnergyCalculator extends StatefulWidget {
  @override
  _BasalEnergyCalculatorState createState() => _BasalEnergyCalculatorState();
}

class _BasalEnergyCalculatorState extends State<BasalEnergyCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double basalEnergy = 0.0;

  void calculateBasalEnergy() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    int age = int.parse(ageController.text);

    if (weight > 0 && height > 0 && age > 0) {
      double basalEnergy = 66.47 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
      setState(() {
        this.basalEnergy = basalEnergy;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basal Energy Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Calculate Basal Energy',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateBasalEnergy();
              },
              child: Text('Calculate Basal Energy'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Basal Energy: ${basalEnergy.toStringAsFixed(2)} kcal',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
