import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Student with ChangeNotifier {
  User _student = User(
    id: "id1",
    name: "Thanawat Benjachatriroj",
    email: "thanawat.bcr@gmail.com",
    role: "student",
    lectures: [
      LectureDetails(
        id: "lec1",
        subjectId: "MTH102",
        name: "Mathematics II",
        room: "CB2312",
        day: "Mon",
        from: "10:30",
        to: "12:30",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec2",
        subjectId: "CSC217",
        name: "Operating Systems",
        room: "CB2308",
        day: "Tue",
        from: "10:30",
        to: "12:00",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec3",
        subjectId: "CSC231",
        name: "Agile Software Engineering",
        room: "CB2306",
        day: "Mon",
        from: "13:30",
        to: "16:30",
        type: "Online",
      ),
      LectureDetails(
        id: "lec4",
        subjectId: "LNG322",
        name: "Academic Writting",
        room: "CB2305",
        day: "Wed",
        from: "09:00",
        to: "12:00",
        type: "Online",
      ),
      LectureDetails(
        id: "lec5",
        subjectId: "MTH102",
        name: "Mathematics II",
        room: "CB2301",
        day: "Thu",
        from: "10:30",
        to: "12:30",
        type: "Hybrid",
      ),
      LectureDetails(
        id: "lec6",
        subjectId: "CSC234",
        name: "Mobile Application",
        room: "Classroom 4/2",
        day: "Thu",
        from: "14:00",
        to: "18:00",
        type: "Online",
      ),
      LectureDetails(
        id: "lec7",
        subjectId: "GEN351",
        name: "Management and Leadership",
        room: "SCL261",
        day: "Fri",
        from: "08:30",
        to: "11:30",
        type: "Online",
      ),
      LectureDetails(
        id: "lec8",
        subjectId: "CSC217",
        name: "Operating Systems",
        room: "CB2306",
        day: "Fri",
        from: "12:50",
        to: "14:20",
        type: "Hybrid",
      ),
    ],
    favoriteLectures: [
      // "teacher1",
      // "teacher2",
    ],
    appointments: [
      AppointmentDetails(id: "app1", lectureId: "lec2", status: "Approved"),
      AppointmentDetails(id: "app2", lectureId: "lec3", status: "Rejected"),
      AppointmentDetails(id: "app3", lectureId: "lec1", status: "Pending"),
    ],
  );
  // _student.lectures.addLecture();

  // String print() {
  //   return _student.toString();
  // }

  String name() {
    return _student.name;
  }

  String printFav() {
    return _student.favoriteLectures.toString();
  }

  void manageFav(String id) {
    int index = _student.favoriteLectures.indexOf(id);
    // print(_student.favoriteLectures.toString());
    if (index == -1) {
      _student.favoriteLectures.add(id);
    } else {
      _student.favoriteLectures.remove(id);
    }
    notifyListeners();
  }

  bool checkFav(String id) {
    int index = _student.favoriteLectures.indexOf(id);
    // print(_student.favoriteLectures[1]);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void delFav(String id) {
    notifyListeners();
  }

  int appointmentLength() {
    return _student.appointments.length;
  }

  void addLecture(String id, String subjectId, String name, String room,
      String day, String from, String to, String type) {
    print(id);
    print(subjectId);
    print(name);
    print(room);
    print(day);
    print(from);
    print(to);
    print(type);
    // if (_lectures.containsKey(id)) {
    //   _lectures.update(
    //       id,
    //       (value) => LectureDetails(
    //             id: value.id,
    //             name: value.name,
    //             email: value.email,
    //             role: "teacher",
    //           ));
    // } else {
    // _lectures.addEntries(newEntries)
    _student.lectures.add(LectureDetails(
        id: id,
        name: name,
        subjectId: subjectId,
        room: room,
        day: day,
        from: from,
        to: to,
        type: type));
    notifyListeners();
  }

  int lectureLength() {
    return _student.lectures.length;
  }

  String subjectId(int lectureIndex) {
    return _student.lectures[lectureIndex].subjectId;
  }

  String subjectName(int lectureIndex) {
    return _student.lectures[lectureIndex].name;
  }

  String room(int lectureIndex) {
    return _student.lectures[lectureIndex].room;
  }

  int day(int lectureIndex) {
    switch (_student.lectures[lectureIndex].day) {
      case "Sun":
        {
          return 0;
        }
        break;
      case "Mon":
        {
          return 1;
        }
        break;
      case "Tue":
        {
          return 2;
        }
        break;
      case "Wed":
        {
          return 3;
        }
        break;
      case "Thu":
        {
          return 4;
        }
        break;
      case "Fri":
        {
          return 5;
        }
        break;
      case "Sat":
        {
          return 6;
        }
        break;
    }
  }

  int fromHr(int lectureIndex) {
    String temp = _student.lectures[lectureIndex].from;
    temp = temp.substring(0, 2);
    return int.parse(temp);
  }

  int toHr(int lectureIndex) {
    String temp = _student.lectures[lectureIndex].to;
    temp = temp.substring(0, 2);
    return int.parse(temp);
  }

  int fromMn(int lectureIndex) {
    String temp = _student.lectures[lectureIndex].from;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  int toMn(int lectureIndex) {
    String temp = _student.lectures[lectureIndex].to;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  String type(int lectureIndex) {
    return _student.lectures[lectureIndex].type;
  }
}
