import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import '../../core/theme/theme.dart';

class ItemField extends StatelessWidget {
  final String title;
  final int maxlines;
  final TextEditingController controller;
  const ItemField(
      {super.key,
      required this.controller,
      required this.maxlines,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              TextStyle(color: blue, fontSize: 13, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 5),
        title == 'PUBLISHED'
            ? DateTimePicker(
                controller: management.published,
                dateMask: 'yyyy-MM-dd HH:mm:ss',
                firstDate: DateTime(1000),
                lastDate: DateTime(2100),
                icon: Icon(Icons.event),
                dateLabelText: 'Date',
                type: DateTimePickerType.dateTime,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: grey200,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    prefixIcon: Icon(Icons.date_range),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.transparent))),
                selectableDayPredicate: (date) {
                  return true;
                },
                onChanged: (val) {},
                validator: (val) {
                  return null;
                },
                onSaved: (val) {
                  management.published.text = '$val';
                })
            : TextField(
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, color: black),
                controller: controller,
                maxLines: maxlines,
                keyboardType: title == 'PAGES' || title == 'ISBN'
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                    hintText:
                        title == 'WEBSITE' ? 'gunakan format link https!' : '',
                    filled: true,
                    fillColor: grey200,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 1, color: blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.transparent))),
              ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
