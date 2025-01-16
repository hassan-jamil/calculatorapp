import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HaSsnii Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display Area
          Container(
            padding: const EdgeInsets.all(60),
            alignment: Alignment.centerRight,
            child: Text(
              provider.display,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: 2),
          // Button Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70), // Adjust the value as needed
              child: Column(
                children: [
                  _buildButtonRow(context, ['7', '8', '9', '/']),
                  _buildButtonRow(context, ['4', '5', '6', '*']),
                  _buildButtonRow(context, ['1', '2', '3', '-']),
                  _buildButtonRow(context, ['C', '0', '=', '+']),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context, List<String> values) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjust horizontal spacing
        children: values.map((value) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Button spacing
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: value == '='
                      ? Colors.blueGrey
                      : value == 'C'
                      ? Colors.blueGrey
                      : Colors.black, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24), // Adjust button size
                ),
                onPressed: () {
                  Provider.of<CalculatorProvider>(context, listen: false)
                      .input(value);
                },
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
