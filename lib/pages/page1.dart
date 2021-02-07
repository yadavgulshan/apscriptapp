import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final name = TextEditingController();
  String dropdownvalue = 'b.tech Information Tech';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          new Text('Your Name'),
          new TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Your name please',
            ),
            controller: name,
          ),
          Row(
            children: [
              Text('Education'),
              DropdownButton<String>(
                value: dropdownvalue,
                icon: Icon(Icons.arrow_drop_down),
                style: TextStyle(color: Colors.deepPurpleAccent),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
                items: <String>[
                  'B.E Information Technology',
                  'B.E Computer Engineering',
                  'B.E Electrical Engineering',
                  'B.E Mechanical Engineering',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
