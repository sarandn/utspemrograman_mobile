import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: EnergyExpenditureCalculator(),
  ));
}

class EnergyExpenditureCalculator extends StatefulWidget {
  @override
  _EnergyExpenditureCalculatorState createState() =>
      _EnergyExpenditureCalculatorState();
}

class _EnergyExpenditureCalculatorState
    extends State<EnergyExpenditureCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double basalEnergy = 0.0;
  double activityFactor = 1.2; // Faktor aktivitas (misalnya 1.2 untuk aktivitas ringan)
  double energyExpenditure = 0.0;

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

  void calculateEnergyExpenditure() {
    calculateBasalEnergy();
    double expenditure = basalEnergy * activityFactor;
    setState(() {
      this.energyExpenditure = expenditure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Expenditure Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Calculate Energy Expenditure',
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
            
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateEnergyExpenditure();
              },
              child: Text('Calculate Energy Expenditure'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Energy Expenditure: ${energyExpenditure.toStringAsFixed(2)} kcal',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
