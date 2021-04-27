import 'package:flutter/foundation.dart';
import 'package:kelena/main.dart';

class User {
  final String id;
  final String name;
  final String email;
  // Role 1 is Student, Role 2 is Teacher
  final String role;
  final List<LectureDetails> lectures;
  final List<FavoriteLectureLists> favoriteLectures;
  final List<AppointmentDetails> appointments;

  const User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.lectures,
    this.favoriteLectures,
    this.appointments,
  });
}

class LectureDetails {
  final String id;
  final String subjectId;
  final String name;
  final String room;
  final String day;
  final String from;
  final String to;
  // Type 1 is Online, Type 2 is Onsite, Type 3 is Hybrid
  final String type;
  const LectureDetails({
    this.id,
    this.subjectId,
    this.name,
    this.room,
    this.day,
    this.from,
    this.to,
    this.type,
  });
}

class FavoriteLectureLists {
  final String lectureId;
  const FavoriteLectureLists({
    this.lectureId,
  });
}

class AppointmentDetails {
  final String id;
  final String lectureId;
  final String status;
  const AppointmentDetails({
    this.id,
    this.lectureId,
    this.status,
  });
}

class UserUpdate with ChangeNotifier {
  void addFav(User student, String lectureId) {
    // FavoriteLectureLists tempLectureId;
    // tempLectureId.lectureId = lectureId;
    // student.favoriteLectures.add(lectureId);
  }
}

// List<LectureDetails> studentLec = [
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
//       day: "Mon",
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
//   ];
//   List<FavoriteLectureLists> favLecList = [
//     FavoriteLectureLists(lectureId: "teacher1"),
//     FavoriteLectureLists(lectureId: "teacher3"),
//   ];
//   List<AppointmentDetails> studentAppointment = [
//     AppointmentDetails(id: "app1", lectureId: "lec2", status: "Approved"),
//     AppointmentDetails(id: "app2", lectureId: "lec3", status: "Rejected"),
//     AppointmentDetails(id: "app3", lectureId: "lec1", status: "Pending"),
//   ];
