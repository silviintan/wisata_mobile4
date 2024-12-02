import 'package:flutter/material.dart';
import 'package:project_travel/models/makanan_model.dart';
import 'package:project_travel/services/makanan_mode.dart';
import 'package:project_travel/widgets/makanan_card.dart';

class Pertemuan9APIScreen extends StatelessWidget {
  final MakananService makananService = MakananService();

  Pertemuan9APIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pertemuan 9 Latihan API',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<MakananModel>>(
        future: makananService.fetchMakanan(),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (Snapshot.hasError) {
            return Center(
              child: Text("Error : ${Snapshot.error}"),
            );
          } else if (!Snapshot.hasData || Snapshot.data!.isEmpty) {
            return Center(
              child: Text("Tidak Ada Makanan Yang Tersedia!"),
            );
          } else {
            final makanan = Snapshot.data!;
            return ListView.builder(itemBuilder: (context, index) {
              return MakananCard(makananModel: makanan[index]);
            });
          }
        },
      ),
    );
  }
}
