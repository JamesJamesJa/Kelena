import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelena/models/user.dart';

class Teacher with ChangeNotifier {
  User _teacher = new User(name: "", lectures: []);
  User get teacher {
    return _teacher;
  }

  Future<void> changeAppointmentStatus(
    String userId,
    String appointId,
    int index,
    bool accept,
  ) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      String lectureId = teacher.appointments[index].lectureId;
      String lecturerId = teacher.appointments[index].lecturerId;
      String status = "Pending";
      if (accept) {
        status = "Approved";
      } else {
        status = "Rejected";
      }
      await FirebaseFirestore.instance
          .collection('users/${userId}/appointment')
          .doc(appointId)
          .update({'status': status});
      teacher.appointments.removeAt(index);
      teacher.appointments.insert(
          index,
          AppointmentDetails(
            lectureId: lectureId,
            lecturerId: lecturerId,
            status: status,
          ));
      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .doc(appointId)
          .update({'status': status});
      teacher.appointments.removeAt(index);
      teacher.appointments.insert(
          index,
          AppointmentDetails(
            lectureId: lectureId,
            lecturerId: lecturerId,
            status: status,
          ));
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> deleteLecture(String lectureId, String userId) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      FirebaseFirestore.instance
          .doc('users/${userId}/lectures/${lectureId}')
          .delete();
      this.teacherDetails();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> studentDetails() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      await FirebaseFirestore.instance
          .doc('users/6GL6X9a0wFZNAxS8y1yb')
          .get()
          .then((querySnapshot) async {
        User temp = User(
          name: querySnapshot.get('name'),
          email: querySnapshot.get('email'),
          id: '6GL6X9a0wFZNAxS8y1yb',
          role: querySnapshot.get('role'),
          appointments: [],
          lectures: [],
          favoriteLectures: [],
        );
        _teacher = temp;

        List<dynamic> favTemp = querySnapshot.get('favLecturers');
        favTemp.forEach((element) {
          _teacher.favoriteLectures.add(element);
        });
      });

      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _teacher.appointments.add(AppointmentDetails(
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
          _teacher.lectures.add(LectureDetails(
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
        _teacher.lectures.clear();
        await FirebaseFirestore.instance
            .collection('users/${userId}/lectures')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            _teacher.lectures.add(LectureDetails(
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
      } else {
        var tempIndex = 0;
        for (var lectureIndex = 0;
            lectureIndex < _teacher.lectures.length;
            lectureIndex++) {
          if (_teacher.lectures[lectureIndex].id == lectureId) {
            tempIndex = lectureIndex;
          }
          _teacher.lectures.removeAt(tempIndex);
          _teacher.lectures.insert(
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
      _teacher.appointments.clear();
      await FirebaseFirestore.instance
          .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _teacher.appointments.add(AppointmentDetails(
            id: element.id,
            lectureId: element.data()['lectureId'],
            lecturerId: element.data()['lecturerId'],
            status: element.data()['status'],
          ));
        });
      });
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
      _teacher.appointments.add(AppointmentDetails(
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
        _teacher = temp;
      });

      await FirebaseFirestore.instance
          .collection('users/cjreWa9KOQom1YywjMBw/appointment')
          .get()
          .then((value) {
        value.docs.forEach((
          element,
        ) {
          _teacher.appointments.add(AppointmentDetails(
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
          _teacher.lectures.add(LectureDetails(
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

  String name() {
    return _teacher.name.toString();
  }

  String id() {
    return _teacher.id;
  }

  String printFav() {
    return _teacher.favoriteLectures.toString();
  }

  String appointmentId(int index) {
    return _teacher.appointments[index].id;
  }

  void manageFav(String id) {
    int index = _teacher.favoriteLectures.indexOf(id);
    if (index == -1) {
      _teacher.favoriteLectures.add(id);
    } else {
      _teacher.favoriteLectures.remove(id);
    }
    FirebaseFirestore.instance
        .doc('users/6GL6X9a0wFZNAxS8y1yb')
        .update({'favLecturers': _teacher.favoriteLectures});
    notifyListeners();
  }

  bool checkFav(String id) {
    int index = _teacher.favoriteLectures.indexOf(id);
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
    return _teacher.appointments.length;
  }

  int appointmentPendingLength() {
    int appCount = 0;
    for (var appIndex = 0;
        appIndex < _teacher.appointments.length;
        appIndex++) {
      if (_teacher.appointments[appIndex].status == "Pending") appCount++;
    }
    return appCount;
  }

  void addLecture(String id, String subjectId, String name, String room,
      String day, String from, String to, String type) {
    _teacher.lectures.add(LectureDetails(
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
    return _teacher.appointments[appointmentIndex].lectureId;
  }

  String appointmentStatus(int appointmentIndex) {
    return _teacher.appointments[appointmentIndex].status;
  }

  String lecturerIdFromAppointment(int appointmentIndex) {
    return _teacher.appointments[appointmentIndex].lecturerId;
  }

  String lectureIdFromAppointment(int appointmentIndex) {
    return _teacher.appointments[appointmentIndex].lectureId;
  }

  int lectureLength() {
    return _teacher.lectures.length;
  }

  String lectureId(int lectureIndex) {
    return _teacher.lectures[lectureIndex].id;
  }

  String subjectId(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _teacher.lectures[lectureIndex].subjectId;
      }
    }
  }

  String subjectName(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _teacher.lectures[lectureIndex].name;
      }
    }
  }

  String room(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _teacher.lectures[lectureIndex].room;
      }
    }
  }

  int day(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        switch (_teacher.lectures[lectureIndex].day) {
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

  String daytoAppointment(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        switch (_teacher.lectures[lectureIndex].day) {
          case "Sun":
            {
              return "Sunday";
            }
            break;
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
        }
      }
    }
  }

  int fromHr(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String tempTime = _teacher.lectures[lectureIndex].from;
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
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String tempTime = _teacher.lectures[lectureIndex].to;
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
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String temp = _teacher.lectures[lectureIndex].from;
        temp = temp.substring(3, 5);
        return int.parse(temp);
      }
    }
  }

  int toMn(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        String temp = _teacher.lectures[lectureIndex].to;
        temp = temp.substring(3, 5);
        return int.parse(temp);
      }
    }
  }

  String type(String lectureId) {
    for (var lectureIndex = 0;
        lectureIndex < _teacher.lectures.length;
        lectureIndex++) {
      if (_teacher.lectures[lectureIndex].id.toString() ==
          lectureId.toString()) {
        return _teacher.lectures[lectureIndex].type;
      }
    }
  }
}
