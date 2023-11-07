import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BMICalculator(),
    ));

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String selectedGender = 'Laki-laki';
  double weight = 60.0;
  double height = 170.0;
  int age = 25;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double bmr = 0.0;
  double karbohidrat = 0.0;
  double lemak = 0.0;
  double protein = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Menghitung Index Masa Tubuh'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Pilih Jenis Kelamin:',
                  style: TextStyle(fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 'Laki-laki',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = 'Laki-laki';
                        });
                      },
                    ),
                    Text('Laki-laki'),
                    Radio(
                      value: 'Perempuan',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = 'Perempuan';
                        });
                      },
                    ),
                    Text('Perempuan'),
                  ],
                ),
                TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Berat Badan (kg)',
                  ),
                ),
                TextFormField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Tinggi Badan (cm)',
                  ),
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Usia (tahun)',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ambil nilai dari input
                    double weightInput =
                        double.tryParse(weightController.text) ?? 0;
                    double heightInput =
                        double.tryParse(heightController.text) ?? 0;
                    int ageInput = int.tryParse(ageController.text) ?? 0;

                    // Hitung BMR
                    if (selectedGender == 'Laki-laki') {
                      bmr = 88.362 +
                          (13.397 * weightInput) +
                          (4.799 * heightInput) -
                          (5.677 * ageInput);
                    } else {
                      bmr = 447.593 +
                          (9.247 * weightInput) +
                          (3.098 * heightInput) -
                          (4.330 * ageInput);
                    }

                    // Hitung kebutuhan nutrisi (contoh: 50% karbo, 30% lemak, 20% protein)
                    karbohidrat = bmr * 0.5 / 4; // 1 gram karbohidrat = 4 Kkal
                    lemak = bmr * 0.3 / 9; // 1 gram lemak = 9 Kkal
                    protein = bmr * 0.2 / 4; // 1 gram protein = 4 Kkal
                  },
                  child: Text('Lihat hasil'),
                ),
                SizedBox(height: 20.0),
                Text(
                    'Hasil Perhitungan BMR berada diangka: ${bmr.toStringAsFixed(2)} Kkal'),
                Text('Kamu memerlukan:'),
                Text(
                    'Kebutuhan Karbohidrat sebanyak: ${karbohidrat.toStringAsFixed(2)} gram'),
                Text(
                    'Kebutuhan Lemak sebanyak: ${lemak.toStringAsFixed(2)} gram'),
                Text(
                    'Kebutuhan Protein sebanyak: ${protein.toStringAsFixed(2)} gram'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
