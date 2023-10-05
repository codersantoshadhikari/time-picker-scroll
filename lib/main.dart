import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(66, 253, 253, 253),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(66, 253, 253, 253),
          title: const Text('Custom Time Picker Example'),
        ),
        body: const Center(
          child: MyTimePicker(),
        ),
      ),
    );
  }
}

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  MyTimePickerState createState() => MyTimePickerState();
}

class MyTimePickerState extends State<MyTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedPeriod = TimeOfDay.now().hour < 12 ? 'AM' : 'PM';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Selected Time: ${selectedTime.hourOfPeriod}:${selectedTime.minute.toString().padLeft(2, '0')} $selectedPeriod',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showTimePicker();
          },
          child: const Text('Select Time'),
        ),
      ],
    );
  }

  void _showTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedTime = TimeOfDay(
                  hour: newDateTime.hour,
                  minute: newDateTime.minute,
                );
                selectedPeriod = newDateTime.hour < 12 ? 'AM' : 'PM';
              });
            },
          ),
        );
      },
    );
  }
}
