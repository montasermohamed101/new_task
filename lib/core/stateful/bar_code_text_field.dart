import 'package:flutter/material.dart';

class BarCodeTextField extends StatefulWidget {
  const BarCodeTextField({super.key});

  @override
  _BarCodeTextFieldState createState() => _BarCodeTextFieldState();
}

class _BarCodeTextFieldState extends State<BarCodeTextField> {
  final TextEditingController _controller = TextEditingController();

  void _handleBarcodeInput(String input) {
    // Process the barcode input as needed
    // For example, display it in a Snackbar or perform actions based on it
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Scanned Barcode: $input')),
    );

    // Optionally clear the text field
    // _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Scan Barcode',
              border: OutlineInputBorder(),
            ),
            onSubmitted: _handleBarcodeInput,
            // Optionally, if you want to capture input on every change:
            // onChanged: _handleBarcodeInput,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Trigger barcode scan processing if needed
              _handleBarcodeInput(_controller.text);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
