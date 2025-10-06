import 'package:flutter/material.dart';
import 'summary_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final stepsController = TextEditingController();
  final waterController = TextEditingController();
  final sleepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Health Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter age' : null,
              ),
              TextFormField(
                controller: stepsController,
                decoration: InputDecoration(labelText: 'Steps walked today'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter steps' : null,
              ),
              TextFormField(
                controller: waterController,
                decoration: InputDecoration(labelText: 'Water intake (liters)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => value!.isEmpty ? 'Enter water intake' : null,
              ),
              TextFormField(
                controller: sleepController,
                decoration: InputDecoration(labelText: 'Hours of sleep'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => value!.isEmpty ? 'Enter sleep hours' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          steps: int.parse(stepsController.text),
                          water: double.parse(waterController.text),
                          sleep: double.parse(sleepController.text),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
