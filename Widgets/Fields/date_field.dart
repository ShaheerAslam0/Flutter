import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class DateInputField extends StatefulWidget {
  const DateInputField({super.key});

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();


  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }


  void _showBottomSheetCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TableCalendar(
                firstDay: DateTime(DateTime.now().year - 100, 1),
                lastDay: DateTime.now(),
                focusedDay: _focusedDate,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDate = focusedDay;
                    _controller.text = "${selectedDay.toLocal()}".split(' ')[0];
                  });
                  Navigator.pop(context);
                },
                onHeaderTapped: (date) {
                  Navigator.pop(context);
                  _selectYear(context, date);
                },
                calendarStyle: const CalendarStyle(
                 selectedDecoration: BoxDecoration(
                 color: Color(0xff0062DC),
                  shape: BoxShape.circle,
                ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xff0062DC),
                    shape: BoxShape.circle,
                  ),
              ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectYear(BuildContext context, DateTime initialDate) async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Material(
            color: Colors.transparent,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime.now(),
              selectedDate: initialDate,
              onChanged: (DateTime newValue) {
                Navigator.pop(context, newValue);
              },
            ),
          ),
        ),
      ),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(picked.year, _selectedDate.month, _selectedDate.day);
        _focusedDate = DateTime(picked.year, _focusedDate.month, _focusedDate.day);
      });

      Future.delayed(const Duration(milliseconds: 10), () {
        _showBottomSheetCalendar(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(

        hintText: '',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Inter-VariableFont_slnt_wght',
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: BorderSide(
            color: _isFocused ? const Color(0xff0062DC) : Colors.white,
            width: 2.0,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: const BorderSide(color: Color(0xff0062DC), width: 2.0),
        ),
      ),
      onTap: () => _showBottomSheetCalendar(context),
    );
  }
}
