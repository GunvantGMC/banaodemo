import 'dart:convert';

import 'package:banaodemo/Apis/ApiData.dart';
import 'package:banaodemo/Models/ApiResponse.dart';
import 'package:banaodemo/Models/ProgramModel.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<ApiResponse> fetchProgramsAPI() async {
  ApiResponse apiResponse;

  try {
    var headers = {'Content-Type': 'application/json'};
    String apiUrl = ApiData.programsApi;

    var request = http.Request(
      'GET',
      Uri.parse(apiUrl),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    var jsonData = jsonDecode(res);

    print("JSON Data : $jsonData");
    List<ProgramModel> programModelList = [];

    // List tempFutureHoursList = jsonData["items"]
    //     .map((i, programJsonData) =>
    //         ProgramModel.fromJson(pos: i, jsonData: programJsonData))
    //     .toList();

    //  for (var programs in tempFutureHoursList) {
    //   programModelList.add(programs);
    // }

    for (var program in jsonData["items"]) {
      ProgramModel programsModel = ProgramModel.fromJson(
        pos: programModelList.length,
        jsonData: program,
      );
      programModelList.add(programsModel);
    }

    print("$programModelList ${programModelList.length} ==");
    if (response.statusCode == 200) {
      apiResponse = ApiResponse(
        title: "Programs Data",
        message: "Programs Data Fetched Successfully",
        response: programModelList,
        success: true,
      );
    } else {
      apiResponse = ApiResponse(
        title: "Programs Error",
        message: "Something Went Wrong",
        success: false,
      );
    }
  } catch (e, stacktrace) {
    apiResponse = ApiResponse(
      title: "Programs Data Exception",
      message: "Something Went Wrong",
      success: false,
    );
    print("Exception $e $stacktrace");
  }
  return apiResponse;
}
