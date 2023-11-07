import 'package:flutter/material.dart';
import 'indexmasatubuh.dart';
import 'energibasal.dart';
import 'energiexpenditure.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Halo, Sari Andini',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Informasi Gizi',
                icon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          _buildCard(
            'Index Masa Tubuh',
            'Ketahui Status Gizimu melalui perbandingan berat dan tinggi badan',
            Color.fromARGB(255, 134, 19, 19),
          ),
          ElevatedButton(
            onPressed: () {
              // Implementasi aksi ketika tombol "Cek Sekarang" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMICalculator()),
              );
            },
            child: Text('Cek Sekarang'),
          ),
          _buildCard(
              'Energi Basal',
              'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh',
              Color.fromARGB(255, 200, 231, 255)),
          ElevatedButton(
            onPressed: () {
              // Implementasi aksi ketika tombol "Cek Sekarang" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BasalEnergyCalculator()),
              );
            },
            child: Text('Cek Sekarang'),
          ),
          _buildCard(
              'Energi Expenditure',
              'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk mempertahankan kehidupan',
              Color.fromARGB(255, 209, 238, 43)),
          ElevatedButton(
            onPressed: () {
              // Implementasi aksi ketika tombol "Cek Sekarang" ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnergyExpenditureCalculator()),
              );
            },
            child: Text('Cek Sekarang'),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String content, Color color) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: color, // Menambahkan warna pada Card
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
