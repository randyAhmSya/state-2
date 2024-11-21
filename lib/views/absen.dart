import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/data_layer.dart';

class ScreenKehadiran extends StatelessWidget {
  const ScreenKehadiran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencatatan Siswa'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Consumer<KehadiranProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: CheckboxListTile(
                    title: Text(
                      student.name,
                      style: TextStyle(
                        fontWeight: student.isPresent
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    value: student.isPresent,
                    activeColor: Colors.blue,
                    onChanged: (_) => provider.togglePresence(index),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
