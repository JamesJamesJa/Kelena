import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Student with ChangeNotifier {
  User _student;
  User get student {
    return _student;
  }

  Future<void> studentDetails() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      await FirebaseFirestore.instance
          .doc('users/6GL6X9a0wFZNAxS8y1yb')
          .get()
          .then((querySnapshot) async {
        // List<dynamic> favTemp = querySnapshot.get('favLecturers');
        User temp = User(
          name: querySnapshot.get('name'),
          email: querySnapshot.get('email'),
          id: '6GL6X9a0wFZNAxS8y1yb',
          role: querySnapshot.get('role'),
          appointments: [],
          lectures: [],
          favoriteLectures: [],
          // favoriteLectures: querySnapshot.get('favLecturers'),
        );
        _student = temp;

        List<dynamic> favTemp = querySnapshot.get('favLecturers');
        favTemp.forEach((element) {
          _student.favoriteLectures.add(element);
          // print(_student.favoriteLectures);
        });

        // _student. = querySnapshot.get('name');

        // print(querySnapshot.data());
      });

      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _student.appointments.add(AppointmentDetails(
            id: element.id,
            lectureId: element.data()['lectureId'],
            lecturerId: element.data()['lecturerId'],
            status: element.data()['status'],
          ));
        });
      });

      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/lectures')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          // print(element.id);
          _student.lectures.add(LectureDetails(
            id: element.id,
            subjectId: element.get('subjectId'),
            name: element.get('subjectName'),
            room: element.get('room'),
            day: element.get('day'),
            from: element.get('from'),
            to: element.get('to'),
            type: element.get('type'),
          ));
          // print(element.data());
        });
      });
      // print(_student.name);
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> addLecturetoDB(
    String lectureId,
    bool addBool,
    String subjectId,
    String subjectName,
    String location,
    String day,
    String from,
    String to,
    String type,
    String userId,
  ) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      if (addBool) {
        FirebaseFirestore.instance.collection('users/${userId}/lectures').add({
          'subjectId': subjectId,
          'subjectName': subjectName,
          'room': location,
          'day': day,
          'from': from,
          'to': to,
          'type': type,
        });
        student.lectures.clear();
        await FirebaseFirestore.instance
            .collection('users/${userId}/lectures')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            _student.lectures.add(LectureDetails(
              id: element.id,
              subjectId: element.get('subjectId'),
              name: element.get('subjectName'),
              room: element.get('room'),
              day: element.get('day'),
              from: element.get('from'),
              to: element.get('to'),
              type: element.get('type'),
            ));
          });
        });

        print("Add Lecture Success!");
      } else {
        var tempIndex = 0;
        for (var lectureIndex = 0;
            lectureIndex < student.lectures.length;
            lectureIndex++) {
          if (student.lectures[lectureIndex].id == lectureId) {
            tempIndex = lectureIndex;
          }
          student.lectures.removeAt(tempIndex);
          student.lectures.insert(
              tempIndex,
              LectureDetails(
                id: lectureId,
                subjectId: subjectId,
                name: subjectName,
                room: location,
                day: day,
                from: from,
                to: to,
                type: type,
              ));
        }
        FirebaseFirestore.instance
            .collection('users/${userId}/lectures')
            .doc(lectureId)
            .set({
          'subjectId': subjectId,
          'subjectName': subjectName,
          'room': location,
          'day': day,
          'from': from,
          'to': to,
          'type': type
        }).catchError((err) {
          print(err);
        });
        print("Edit Lecture Success!");
      }
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> addAppointtoDB(String lectureId, String lecturerId) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      String appointmentId = "";
      FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .add({
        'lectureId': lectureId,
        'lecturerId': lecturerId,
        'status': 'Pending',
      }).then((value) => appointmentId = value.id);
      _student.appointments.clear();
      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _student.appointments.add(AppointmentDetails(
            id: element.id,
            lectureId: element.data()['lectureId'],
            lecturerId: element.data()['lecturerId'],
            status: element.data()['status'],
          ));
        });
      });
      // print(lectureId + " AppID:" + appointmentId);
      FirebaseFirestore.instance
          .collection('users')
          .doc(lecturerId)
          .collection('appointment')
          .doc(appointmentId)
          .set({
        'lectureId': lectureId,
        'lecturerId': "6GL6X9a0wFZNAxS8y1yb",
        'status': 'Pending',
      });
      student.appointments.add(AppointmentDetails(
        id: appointmentId,
        lectureId: lectureId,
        lecturerId: lecturerId,
        status: 'Pending',
      ));

      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> teacherDetails() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      await FirebaseFirestore.instance
          .doc('users/cjreWa9KOQom1YywjMBw')
          .get()
          .then((querySnapshot) async {
        User temp = User(
          name: querySnapshot.get('name'),
          email: querySnapshot.get('email'),
          id: 'cjreWa9KOQom1YywjMBw',
          role: querySnapshot.get('role'),
          appointments: [],
          lectures: [],
        );
        _student = temp;
      });

      await FirebaseFirestore.instance
          .collection('users/cjreWa9KOQom1YywjMBw/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _student.appointments.add(AppointmentDetails(
            id: element.id,
            lectureId: element.data()['lectureId'],
            lecturerId: element.data()['lecturerId'],
            status: element.data()['status'],
          ));
        });
      });

      await FirebaseFirestore.instance
          .collection('users/cjreWa9KOQom1YywjMBw/lectures')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          _student.lectures.add(LectureDetails(
            id: element.id,
            subjectId: element.get('subjectId'),
            name: element.get('subjectName'),
            room: element.get('room'),
            day: element.get('day'),
            from: element.get('from'),
            to: element.get('to'),
            type: element.get('type'),
          ));
        });
      });
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  // User _student = User(
  //   id: "id1",
  //   name: "Thanawat Benjachatriroj",
  //   email: "thanawat.bcr@gmail.com",
  //   role: "student",
  //   lectures: [
  //     LectureDetails(
  //       id: "lec1",
  //       subjectId: "MTH102",
  //       name: "Mathematics II",
  //       room: "CB2312",
  //       day: "Mon",
  //       from: "10:30",
  //       to: "12:30",
  //       type: "Hybrid",
  //     ),
  //     LectureDetails(
  //       id: "lec2",
  //       subjectId: "CSC217",
  //       name: "Operating Systems",
  //       room: "CB2308",
  //       day: "Tue",
  //       from: "10:30",
  //       to: "12:00",
  //       type: "Hybrid",
  //     ),
  //     LectureDetails(
  //       id: "lec3",
  //       subjectId: "CSC231",
  //       name: "Agile Software Engineering",
  //       room: "CB2306",
  //       day: "Tue",
  //       from: "13:30",
  //       to: "16:30",
  //       type: "Online",
  //     ),
  //     LectureDetails(
  //       id: "lec4",
  //       subjectId: "LNG322",
  //       name: "Academic Writting",
  //       room: "CB2305",
  //       day: "Wed",
  //       from: "09:00",
  //       to: "12:00",
  //       type: "Online",
  //     ),
  //     LectureDetails(
  //       id: "lec5",
  //       subjectId: "MTH102",
  //       name: "Mathematics II",
  //       room: "CB2301",
  //       day: "Thu",
  //       from: "10:30",
  //       to: "12:30",
  //       type: "Hybrid",
  //     ),
  //     LectureDetails(
  //       id: "lec6",
  //       subjectId: "CSC234",
  //       name: "Mobile Application",
  //       room: "Classroom 4/2",
  //       day: "Thu",
  //       from: "14:00",
  //       to: "18:00",
  //       type: "Online",
  //     ),
  //     LectureDetails(
  //       id: "lec7",
  //       subjectId: "GEN351",
  //       name: "Management and Leadership",
  //       room: "SCL261",
  //       day: "Fri",
  //       from: "08:30",
  //       to: "11:30",
  //       type: "Online",
  //     ),
  //     LectureDetails(
  //       id: "lec8",
  //       subjectId: "CSC217",
  //       name: "Operating Systems",
  //       room: "CB2306",
  //       day: "Fri",
  //       from: "12:50",
  //       to: "14:20",
  //       type: "Hybrid",
  //     ),
  //   ],
  //   favoriteLectures: [
  //     // "teacher1",
  //     // "teacher2",
  //   ],
  //   appointments: [
  //     AppointmentDetails(id: "app1", lectureId: "lec2", status: "Approved"),
  //     AppointmentDetails(id: "app2", lectureId: "lec3", status: "Rejected"),
  //     AppointmentDetails(id: "app3", lectureId: "lec1", status: "Pending"),
  //   ],
  // );
  // _student.lectures.addLecture();

  // String print() {
  //   return _student.toString();
  // }

  String name() {
    return _student.name;
  }

  String id() {
    return _student.id;
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
    FirebaseFirestore.instance
        .doc('users/6GL6X9a0wFZNAxS8y1yb')
        .update({'favLecturers': _student.favoriteLectures});
    notifyListeners();
  }

  bool checkFav(String id) {
    int index = _student.favoriteLectures.indexOf(id);
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

  String subjectIdFromAppointment(int appointmentIndex) {
    return _student.appointments[appointmentIndex].lectureId;
  }

  String appointmentStatus(int appointmentIndex) {
    return _student.appointments[appointmentIndex].status;
  }

  String lecturerIdFromAppointment(int appointmentIndex) {
    return _student.appointments[appointmentIndex].lecturerId;
  }

  String lectureIdFromAppointment(int appointmentIndex) {
    return _student.appointments[appointmentIndex].lectureId;
  }

  int lectureLength() {
    return _student.lectures.length;
  }

  String lectureId(int lectureIndex) {
    return _student.lectures[lectureIndex].id;
  }

  String subjectId(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _student.lectures[lectureIndex].subjectId;
      }
    }
  }

  String subjectName(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _student.lectures[lectureIndex].name;
      }
    }
  }

  String room(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _student.lectures[lectureIndex].room;
      }
    }
  }

  int day(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
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
    }
  }

  int fromHr(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String tempTime = _student.lectures[lectureIndex].from;
        String tempHr = tempTime.substring(0, 2);
        if (tempTime.substring(tempTime.length - 2) == "AM" ||
            (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
                tempHr.toString() == "12")) {
          return int.parse(tempHr);
        } else {
          return int.parse(tempHr) + 12;
        }
      }
    }
    return 0;
  }

  int toHr(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String tempTime = _student.lectures[lectureIndex].to;
        String tempHr = tempTime.substring(0, 2);
        if (tempTime.substring(tempTime.length - 2) == "AM" ||
            (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
                tempHr.toString() == "12")) {
          return int.parse(tempHr);
        } else {
          return int.parse(tempHr) + 12;
        }
      }
    }
    return 0;
  }

  int fromMn(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String temp = _student.lectures[lectureIndex].from;
        temp = temp.substring(3, 5);
        return int.parse(temp);
      }
    }
  }

  int toMn(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String temp = _student.lectures[lectureIndex].to;
        temp = temp.substring(3, 5);
        return int.parse(temp);
      }
    }
  }

  String type(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _student.lectures.length;
        lectureIndex++) {
      if (_student.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _student.lectures[lectureIndex].type;
      }
    }
  }
}
