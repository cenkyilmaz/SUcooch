import 'package:flutter/material.dart';
import 'dart:developer';


class SingleSelectionExample extends StatefulWidget {
  List<String> lang;

  SingleSelectionExample(this.lang);

  @override
  _SingleSelectionExampleState createState() => _SingleSelectionExampleState();
}

class _SingleSelectionExampleState extends State<SingleSelectionExample> {
  String selectedValue = "";

  @override
  void initState() {
    super.initState();

    selectedValue = widget.lang.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            selectedValue = widget.lang[index];
            setState(() {});
          },
          child: Container(
            color: selectedValue == widget.lang[index]
                ? Colors.green[100]
                : null,
            child: Row(
              children: <Widget>[
                Radio(
                    value: widget.lang[index],
                    groupValue: selectedValue,
                    onChanged: (s) {
                      log(s.toString());
                      selectedValue = s.toString();
                      setState(() {});
                    }),
                Text(widget.lang[index])
              ],
            ),
          ),
        );
      },
      itemCount: widget.lang.length,
    );
  }
}