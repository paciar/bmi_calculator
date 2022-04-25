import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _BMI = 0.0;
  String _BMIEval = 'Not evaluated yet';

  void _calculateBMI() {
    setState(() {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);
      _BMI =
          double.parse((703 * weight / (height * height)).toStringAsFixed(1));
    });
  }

  void _evaluateBMI() {
    setState(() {
      if (_BMI < 18.5) {
        _BMIEval = 'Underweight';
      } else if (_BMI >= 18.5 && _BMI < 25) {
        _BMIEval = 'Normal';
      } else if (_BMI >= 25 && _BMI < 30) {
        _BMIEval = 'Overweight';
      } else if (_BMI >= 30 && _BMI < 35) {
        _BMIEval = 'Obese';
      } else {
        _BMIEval = 'Extremely obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            space(),
            height(),
            space(),
            weight(),
            space(),
            calculateButton(),
            space(),
            BMI(),
            space(),
            BMIEval()
          ],
        ),
      ),
    );
  }

  Widget BMI() {
    return Text(
      'Your BMI: $_BMI',
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget BMIEval() {
    return Text(
      'Your BMI indicates that you are: \n $_BMIEval',
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget calculateButton() {
    return TextButton(
        onPressed: () {
          _calculateBMI();
          _evaluateBMI();
        },
        child: const Text(
          'Calculate BMI',
          style: TextStyle(fontSize: 25),
        ));
  }

  Widget space() {
    return const SizedBox(height: 25);
  }

  TextEditingController heightController = TextEditingController();
  Widget height() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Height',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: const InputDecoration(
                  hintText: 'Enter your height in inches.'),
            ),
          )
        ],
      ),
    );
  }

  TextEditingController weightController = TextEditingController();
  Widget weight() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Weight',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 300,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: const InputDecoration(
                  hintText: 'Enter your weight in pounds.'),
            ),
          )
        ],
      ),
    );
  }
}
