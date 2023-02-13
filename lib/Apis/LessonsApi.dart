import 'dart:convert';

import 'package:banaodemo/Apis/ApiData.dart';
import 'package:banaodemo/Models/ApiResponse.dart';
import 'package:banaodemo/Models/LessonModel.dart';
import 'package:banaodemo/Models/ProgramModel.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<ApiResponse> fetchLessonsAPI() async {
  ApiResponse apiResponse;

  try {
    var headers = {'Content-Type': 'application/json'};
    String apiUrl = ApiData.lessonsApi;

    var request = http.Request(
      'GET',
      Uri.parse(apiUrl),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    var jsonData = jsonDecode(res);

    print("JSON Data : $jsonData");
    List<LessonModel> lessonModelList = [];

    for (var lessons in jsonData["items"]) {
      LessonModel lessonModel = LessonModel.fromJson(
        pos: lessonModelList.length,
        jsonData: lessons,
      );
      lessonModelList.add(lessonModel);
    }

    print("$lessonModelList ${lessonModelList.length} ==");
    if (response.statusCode == 200) {
      apiResponse = ApiResponse(
        title: "Lessons Data",
        message: "Lessons Data Fetched Successfully",
        response: lessonModelList,
        success: true,
      );
    } else {
      apiResponse = ApiResponse(
        title: "Lessons Error",
        message: "Something Went Wrong",
        success: false,
      );
    }
  } catch (e, stacktrace) {
    apiResponse = ApiResponse(
      title: "Lessons Data Exception",
      message: "Something Went Wrong",
      success: false,
    );
    print("Exception $e $stacktrace");
  }
  return apiResponse;
}
