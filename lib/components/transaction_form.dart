import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit});

  _onSubmitForm() {
    this.onSubmit(
        titleController.text, double.tryParse(valueController.text) ?? 0.0);
  }

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
              onSubmitted: (_) => _onSubmitForm(),
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmitForm(),
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
                    onPressed: _onSubmitForm,
                    child: Text('Nova Transação')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
