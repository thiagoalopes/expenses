import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        side: BorderSide(width: 1, color: Colors.purple),
                        backgroundColor: Colors.transparent,
                        elevation: 0),
                    onPressed: () => {
                          this.onSubmit(titleController.text,
                              double.tryParse(valueController.text) ?? 0.0)
                        },
                    child: Text('Nova Transação')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
