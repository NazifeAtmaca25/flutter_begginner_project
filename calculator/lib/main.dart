import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView.builder Örneği'),
        ),
        body: GridView.builder(
          // Izgaranın nasıl düzenleneceğini belirler.
          // SliverGridDelegateWithFixedCrossAxisCount: Sabit sütun sayısı
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 sütun
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          // Toplam öğe sayısı
          itemCount: 50,
          // Her bir öğenin nasıl oluşturulacağını belirler
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.green[100 * (index % 9) + 100],
              child: Center(
                child: Text(
                  'Foto ${index + 1}',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
