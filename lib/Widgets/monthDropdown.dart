import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/presentation/Expense/Controller/ExpenseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

   RxString date="".obs;
   RxString time="".obs;
class DateTimePickerContainer extends StatefulWidget {
  @override
  _DateTimePickerContainerState createState() => _DateTimePickerContainerState();
}

class _DateTimePickerContainerState extends State<DateTimePickerContainer> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context); // Initialize ScreenSizeConfig

    return GestureDetector(
      onTap: () {
        _showDateTimePicker(context);
      },
      child: Container(
        height: 60,
        width: ScreenSizeConfig.screenWidth * 0.8,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Themecolor.themecolor), // Border color and width
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            _selectedDate != null && _selectedTime != null
                ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year} ${_selectedTime!.hour}:${_selectedTime!.minute}'
                : 'Tap to select Date and Time',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedTime = pickedTime;
          time.value='${_selectedTime!.hour}:${_selectedTime!.minute}';
          date.value='${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
        });
        print('Selected Date and Time: $_selectedDate $_selectedTime');
        // Handle selected date and time
      }
    }
  }
}