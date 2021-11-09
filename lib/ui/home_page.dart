// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/task_controller.dart';
import 'package:flutter_todo_app/services/notification_services.dart';
import 'package:flutter_todo_app/services/theme_services.dart';
import 'package:flutter_todo_app/ui/theme.dart';
import 'package:flutter_todo_app/ui/widgets/button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'add_task_bar.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({Key? key}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables

  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  // ignore: prefer_typing_uninitialized_variables, unused_field
  DateTime _selectedDate = DateTime.now();

  // ignore: prefer_typing_uninitialized_variables

  // ignore: prefer_typing_uninitialized_variables
  var notifyHelper;
  final _taskController = Get.put(TaskController());
  @override
  void initState() {
    // ignore: todo
    //TODO:implement initstate
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          _addTaskbar(),
          _addDatebar(),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, context) {
            // ignore: avoid_print
            print(_taskController.taskList.length);
            return Container(
              width: 100,
              height: 50,
              color: Colors.green,
              margin: EdgeInsets.only(bottom: 10),
              child: Text("hello world"),
            );
          },
        );
      }),
    );
  }

  _addDatebar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskbar() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
              label: "+ Add Task",
              onTap: () async {
                await Get.to(AddTaskPage());
              })
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().swithTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );

          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 22,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/profile.png"),
          ),
        ),
      ],
    );
  }
}
