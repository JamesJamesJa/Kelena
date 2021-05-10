// class FavoriteManagement with ChangeNotifier {
//   Map<String, FavoriteLectureLists> _lectures = {};
//   void add(String id) {
//     _lectures.addEntries(id);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Teachers with ChangeNotifier {
  List<User> _teacher = [];
  List<User> get teacher {
    return _teacher;
  }

  Future<void> teachersFromDB() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      await FirebaseFirestore.instance.collection('users').get().then((value) {
        _teacher = [];
        value.docs.forEach((element) {
          if (element.get('role') == "teacher") {
            _teacher.add(User(
              id: element.id,
              name: element.get('name'),
              email: element.get('email'),
              role: element.get('role'),
              lectures: [],
              appointments: [],
            ));
          }
        });
      });
      for (var i = 0; i < _teacher.length; i++) {
        await FirebaseFirestore.instance
            .collection('users/${_teacher[i].id}/lectures')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            _teacher[i].lectures.add(
                  LectureDetails(
                    id: element.id,
                    subjectId: element.get('subjectId'),
                    name: element.get('subjectName'),
                    room: element.get('room'),
                    day: element.get('day'),
                    from: element.get('from'),
                    to: element.get('to'),
                    type: element.get('type'),
                  ),
                );
            // print(element.data());
          });
        });
        await FirebaseFirestore.instance
            .collection('users/${_teacher[i].id}/appointment')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            _teacher[i].appointments.add(AppointmentDetails(
                  id: element.id,
                  lectureId: element.data()['lectureId'],
                  lecturerId: element.data()['lecturerId'],
                  status: element.data()['status'],
                ));
          });
        });
      }
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  List<User> get users {
    return _users;
  }

  List<User> _users = [
    User(
      id: "teacher1",
      name: "Ben Malaja",
      email: "ben.mala@gmail.com",
      role: "teacher",
      lectures: [
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
    ),
    User(
      id: "teacher2",
      name: "Noname Nolastname",
      email: "no.no@gmail.com",
      role: "teacher",
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
          id: "lec9",
          subjectId: "MTH103",
          name: "Mathematics III",
          room: "CB2306",
          day: "Thu",
          from: "14:50",
          to: "16:20",
          type: "Hybrid",
        ),
      ],
    ),
  ];

  List<User> get getAll {
    return [..._users];
  }

  User allDetails(String id) {
    for (var i = 0; i < _users.length; i++) {
      if (_users[i].id == id) {
        return _users[i];
      }
    }
  }

  // int length(){
  //   return _teacher.length;
  // }

  String teacherNameFromLecturerId(String lecturerId) {
    for (var i = 0; i < _teacher.length; i++) {
      if (_teacher[i].id == lecturerId) {
        return _teacher[i].name;
      }
    }
  }

  String appointmentDayFromLecturerId(String lecturerId, String lectureId) {
    for (var i = 0; i < _teacher.length; i++) {
      if (_teacher[i].id == lecturerId) {
        for (var j = 0; j < _teacher[i].lectures.length; j++) {
          if (_teacher[i].lectures[j].id == lectureId) {
            switch (_teacher[i].lectures[j].day) {
              case "Mon":
                {
                  return "Monday";
                }
                break;
              case "Tue":
                {
                  return "Tuesday";
                }
                break;
              case "Wed":
                {
                  return "Wednesday";
                }
                break;
              case "Thu":
                {
                  return "Thursday";
                }
                break;
              case "Fri":
                {
                  return "Friday";
                }
                break;
              case "Sat":
                {
                  return "Saturday";
                }
                break;
              case "Sun":
                {
                  return "Sunday";
                }
                break;
            }
          }
        }
      }
    }
  }

  int lectureLength(int index) {
    return _teacher[index].lectures.length;
  }

  String subjectId(int teacherIndex, int lectureIndex) {
    return _teacher[teacherIndex].lectures[lectureIndex].subjectId;
  }

  String subjectIdFromAppointment(String lecturerId, String lectureId) {
    for (var lecturerIndex = 0;
        lecturerIndex < _teacher.length;
        lecturerIndex++) {
      if (lecturerId == _teacher[lecturerIndex].id) {
        for (var lectureIndex = 0;
            lectureIndex < _teacher[lecturerIndex].lectures.length;
            lectureIndex++) {
          if (_teacher[lecturerIndex].lectures[lectureIndex].id.toString() ==
              lectureId.toString()) {
            return _teacher[lecturerIndex].lectures[lectureIndex].subjectId;
          }
        }
      }
    }
  }

  String subjectName(int teacherIndex, int lectureIndex) {
    return _teacher[teacherIndex].lectures[lectureIndex].name;
  }

  String subjectNameFromAppointment(String lecturerId, String lectureId) {
    for (var lecturerIndex = 0;
        lecturerIndex < _teacher.length;
        lecturerIndex++) {
      if (lecturerId == _teacher[lecturerIndex].id) {
        for (var lectureIndex = 0;
            lectureIndex < _teacher[lecturerIndex].lectures.length;
            lectureIndex++) {
          if (_teacher[lecturerIndex].lectures[lectureIndex].id.toString() ==
              lectureId.toString()) {
            return _teacher[lecturerIndex].lectures[lectureIndex].name;
          }
        }
      }
    }
  }

  String room(int teacherIndex, int lectureIndex) {
    return _teacher[teacherIndex].lectures[lectureIndex].room;
  }

  String roomFromAppointment(String lecturerId, String lectureId) {
    for (var lecturerIndex = 0;
        lecturerIndex < _teacher.length;
        lecturerIndex++) {
      if (lecturerId == _teacher[lecturerIndex].id) {
        for (var lectureIndex = 0;
            lectureIndex < _teacher[lecturerIndex].lectures.length;
            lectureIndex++) {
          if (_teacher[lecturerIndex].lectures[lectureIndex].id.toString() ==
              lectureId.toString()) {
            return _teacher[lecturerIndex].lectures[lectureIndex].room;
          }
        }
      }
    }
  }

  int day(int teacherIndex, int lectureIndex) {
    switch (_teacher[teacherIndex].lectures[lectureIndex].day) {
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

  int fromHr(int teacherIndex, int lectureIndex) {
    // String temp = _teacher[teacherIndex].lectures[lectureIndex].from;
    // temp = temp.substring(0, 2);
    // return int.parse(temp);
    String tempTime = _teacher[teacherIndex].lectures[lectureIndex].from;
    String tempHr = tempTime.substring(0, 2);
    if (tempTime.substring(tempTime.length - 2) == "AM" ||
        (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
            tempHr.toString() == "12")) {
      return int.parse(tempHr);
    } else {
      return int.parse(tempHr) + 12;
    }
  }

  int toHr(int teacherIndex, int lectureIndex) {
    // String temp = _teacher[teacherIndex].lectures[lectureIndex].to;
    // temp = temp.substring(0, 2);
    // return int.parse(temp);
    String tempTime = _teacher[teacherIndex].lectures[lectureIndex].to;
    String tempHr = tempTime.substring(0, 2);
    if (tempTime.substring(tempTime.length - 2) == "AM" ||
        (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
            tempHr.toString() == "12")) {
      return int.parse(tempHr);
    } else {
      return int.parse(tempHr) + 12;
    }
  }

  int fromMn(int teacherIndex, int lectureIndex) {
    String temp = _teacher[teacherIndex].lectures[lectureIndex].from;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  int toMn(int teacherIndex, int lectureIndex) {
    String temp = _teacher[teacherIndex].lectures[lectureIndex].to;
    temp = temp.substring(3, 5);
    return int.parse(temp);
  }

  String type(int teacherIndex, int lectureIndex) {
    return _teacher[teacherIndex].lectures[lectureIndex].type;
  }

  int teacherLength() {
    return _teacher.length;
  }

  String id(int index) {
    return _teacher[index].id;
  }

  String name(int index) {
    return _teacher[index].name;
  }

  String lecId(int teacherIndex, int lectureIndex) {
    return _teacher[teacherIndex].lectures[lectureIndex].id;
  }

  // String name(int index) {
  //   return _users[index].name;
  // }

  // void addLecturer(String id, String name, String email) {
  //   _users.putIfAbsent(
  //       id,
  //       () => User(
  //             id: id,
  //             name: name,
  //             email: email,
  //             role: "teacher",
  //           ));
  //   notifyListeners();
  // }

  // void addLecture(String id, String lectureId, String subjectId, String name,
  //     String room, String day, String from, String to, String type) {
  //   _users.putIfAbsent(
  //       id,
  //       () => User(
  //             id: id,
  //             lectures: [
  //               LectureDetails(
  //                 id: lectureId,
  //                 subjectId: subjectId,
  //                 name: name,
  //                 room: room,
  //                 day: day,
  //                 from: from,
  //                 to: to,
  //                 type: type,
  //               ),
  //             ],
  //           ));
  //   // }
  //   notifyListeners();
  // }

  void addFav(User student, String lectureId) {
    // FavoriteLectureLists tempLectureId;
    // tempLectureId.lectureId = lectureId;
    // student.favoriteLectures.add(lectureId);
  }
}
