import 'package:flutter/material.dart';
import 'package:persian_modal_date_picker/persian_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  Date? _selectedDate;

  String format(Date? d) {
    if (d == null) return '';
    final formatter = d.formatter;
    return '${formatter.wN} ${formatter.d} '
        '${formatter.mN} ${formatter.yyyy}';
  }

  void showDatePicker() async {
    await showPersianDatePicker(
      context,
          (context, Date date) async {
        setState(() {
          _selectedDate = date;
        });
        Navigator.of(context).pop();
      },
      yearDirection: YearDirection.both,
      border: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(15),
      ),
      // validate: (ctx, date) {
      //   return date.year < 1402;
      // },
      submitButtonStyle: defaultButtonsStyle
          .copyWith(
        text: 'انتخاب',
        backgroundColor: Colors.blueAccent,
        radius: 10,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('persian_modal_date_picker'),
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: showDatePicker,
        tooltip: 'show',
        label: const Text('Pick Date'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Your Selected Date is:',
              style: Theme.of(context)
                  .textTheme.headline5,
            ),
            const SizedBox(height: 15),
            Text(
              format(_selectedDate),
              style: Theme.of(context)
                  .textTheme.headline6,
            ),


          ],
        ),
      ),

    );
  }
}






















