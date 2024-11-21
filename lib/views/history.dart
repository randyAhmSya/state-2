import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/data_layer.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman History'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<KehadiranProvider>(
        builder: (context, provider, child) {
          final history = provider.historyKehadiran;

          if (history.isEmpty) {
            return const Center(
              child: Text(
                'Tidak ada riwayat',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }

          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final record = history[index];
              return Center(
                child: ListTile(
                  title: Text(
                    DateFormat('dd MMM yyyy HH:mm').format(record.date),
                  ),
                  subtitle: Text(
                    'Hadir: ${record.presentStudents.length}, '
                    'Tidak Hadir: ${record.absentStudents.length}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
