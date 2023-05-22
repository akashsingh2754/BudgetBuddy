import 'package:flutter/material.dart';

class NewTransactiom extends StatefulWidget {
  late final Function ADDtx;

  NewTransactiom(this.ADDtx);

  @override
  State<NewTransactiom> createState() => _NewTransactiomState();
}

class _NewTransactiomState extends State<NewTransactiom> {
  final _tittlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();

  void _submitadata() {
    final enterText = _tittlecontroller.text;
    final enterAmount = double.parse(_amountcontroller.text);
    if (enterAmount <= 0 || enterText.isEmpty) {
      Text('no transction found');
    }
    widget.ADDtx(
      enterText,
      enterAmount,
    );
    Navigator.of(context).pop();
  }

  void PresentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime.now(),
    ).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: ('Tittle'),
            ),
            controller: _tittlecontroller,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: ('Amount'),
            ),
            controller: _amountcontroller,
            onSubmitted: (value) => {_submitadata()},
          ),
          Column(
            children: [
              Text('no date added'),
              SizedBox(
                height: 4,
              ),
              ElevatedButton(
                  onPressed: PresentDataPicker,
                  child: Text('selectDate',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontSize: 10,
                      )))
            ],
          ),
          TextButton(
            onPressed: _submitadata,
            child: Text('Create Transction',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
