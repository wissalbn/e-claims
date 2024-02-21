import 'package:flutter/material.dart';

class ListItem {
  final String value;
  final String label;

  ListItem(this.value, this.label);
}

class liste extends StatefulWidget {
  @override
  _listeState createState() => _listeState();
}

class _listeState extends State<liste> {
  List<ListItem> _items = [
    ListItem('value1', 'Item 1'),
    ListItem('value2', 'Item 2'),
    ListItem('value3', 'Item 3'),
  ];
  late String _selectedItemValue='value1';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        child: TextFormField(
          textAlign: TextAlign.center,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 26),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFfbbc05), width: 3),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFfbbc05),
              ),
            ),
          ),
          onTap: () {
            _showDropdown(context);
          },
          controller: TextEditingController(
            text: _selectedItemValue ?? '',
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.minPositive,
            child: DropdownButtonFormField<String>(
              value: _selectedItemValue,
              items: _items.map((item) {
                return DropdownMenuItem<String>(
                  value: item.value,
                  child: Text(item.label),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedItemValue = newValue!;
                  Navigator.pop(context);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

