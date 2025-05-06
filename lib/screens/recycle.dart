import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteless/components/button.dart';
import 'package:wasteless/screens/home.dart';

class RecycleFormPage extends StatefulWidget {
  const RecycleFormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecycleFormPageState createState() => _RecycleFormPageState();
}

class _RecycleFormPageState extends State<RecycleFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedWasteType;
  String? _selectedShift;
  DateTime? _deliveryDate;
  bool _agree = false;

  void _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _deliveryDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recycle",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 30)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Recycle Form",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 36)),
              SizedBox(height: 16),
              Text("Ariana Wasteless Center",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                  "Recycling drop-off location\n02 Rue Abdallah Ibn JAAFAR 2073\nLa Soukra, Ariana"),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Submitter's Name*"),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 16),
              Text("Waste Type*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: [
                  'Plastic Bottles',
                  'Cardboard & Paper',
                  'Iron',
                  'Aluminum',
                  'Glass',
                  'Electronic'
                ]
                    .map((type) => RadioListTile<String>(
                          title: Text(type),
                          value: type,
                          groupValue: _selectedWasteType,
                          onChanged: (value) {
                            setState(() {
                              _selectedWasteType = value;
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text("Delivery Shift*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: [
                  'Morning (08:00 - 10:59)',
                  'Daylight (11:00 - 13:59)',
                  'Afternoon (14:00 - 18:00)'
                ]
                    .map((shift) => RadioListTile<String>(
                          title: Text(shift),
                          value: shift,
                          groupValue: _selectedShift,
                          onChanged: (value) {
                            setState(() {
                              _selectedShift = value;
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text("Delivery Date*",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ListTile(
                title: Text(_deliveryDate == null
                    ? "Select a date"
                    : DateFormat.yMMMd().format(_deliveryDate!)),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _pickDate(context),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Estimate Weight*"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Additional Information (Optional)"),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text("Upload Waste Pictures",
                    style: TextStyle(color: Colors.green)),
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text("I agree with all the data provided"),
                value: _agree,
                onChanged: (value) {
                  setState(() {
                    _agree = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                text: "Send",
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agree) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Form submitted successfully!"),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
