
import 'dart:developer';
import 'dart:io';

import 'package:ai_bot_task/Model/error_response_model.dart';
import 'package:ai_bot_task/core/exceptions.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as G;


import 'package:path/path.dart' as p;



import 'dio_client.dart';




class HTTPRequestProvider {
  HTTPRequestProvider();
   Dio dio= Dio();

  final DioClient dioClient = DioClient();

  Future makeGetAPICall({required String url}) async {
    try {
      final response = await dioClient.dio.get(url);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeSimpleGetAPICall({required String url}) async {
    try {
      final response = await dioClient.dio.get(url);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } catch (error) {
      throw error;
    }
  }





  Future makePUTAPICall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dioClient.dio.put(url, data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makePOSTAPICall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dioClient.dio.post(url, data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeSignUpAPiCall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dio.post("https://muffinlive-a30118e149c2.herokuapp.com${url}", data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      if(response.statusCode==200){
        G.Get.snackbar('Success', 'Verification Code Sent Successfully');
      }
      return response.data;
    } on DioException catch (error) {
      G.Get.snackbar('Error', error.response?.data?['message']??'');
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeVerifyOTPCall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dio.post("https://muffinlive-a30118e149c2.herokuapp.com${url}", data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      if(response.statusCode==200){
        G.Get.snackbar('Success', 'Account Created Successfully');
      }
      return response.data;
    } on DioException catch (error) {
      G.Get.snackbar('Error', error.response?.data?['message']??'');
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeProfileSetupCall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dio.post("https://muffinlive-a30118e149c2.herokuapp.com${url}", data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      if(response.statusCode==200){

        G.Get.snackbar('Success', 'Account Setup Successfully');
      }
      return response.data;
    } on DioException catch (error) {
      G.Get.snackbar('Error', error.response?.data?['message']??'');
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeLoginApiCall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dio.post("https://muffinlive-a30118e149c2.herokuapp.com${url}", data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      if(response.statusCode==200){

        G.Get.snackbar('Success', 'Account Login Successfully');

      }

      // await PrefUtils().setUserToken(response.data['token']);
      // SingletonProfileModel().userModel = UserModel.fromJson(response.data);
      return response.data;
    } on DioException catch (error) {
      G.Get.snackbar('Error', error.response?.data?['message']??'');
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }


  Future login() async {
   try{
     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
     var body = {
       "deviceId" : Platform.isAndroid ? (await deviceInfo.androidInfo).id : (await deviceInfo.iosInfo).identifierForVendor,
        "devicePlatform" : Platform.isAndroid ? "android" : "ios",
     };
      final response = await dio.post("https://dev.newtype-backend.zazz.buzz/api/auth/login", data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
   }catch(e){
      log(e.toString());
   }
  }

  Future<dynamic> makePOSTAPICallWithFormData(
      {required String url, required FormData formData}) async {
    try {
      final response = await dioClient.dio.post(
        url,
        data: formData,
      );
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makeDELETEAPICall({required String url}) async {
    try {
      final response = await dioClient.dio.delete(url);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }

  Future makePATCHAPICall(
      {required String url, required dynamic bodyParams}) async {
    try {
      final response = await dioClient.dio.patch(url, data: bodyParams);
      if (response.statusCode == 400) {
        showCustomDialog();
      }
      return response.data;
    } on DioException catch (error) {
      return handleErrorResponses(error);
    } catch (error) {
      rethrow;
    }
  }



  Future handleErrorResponses(DioException error) async {
    if (error.response?.data["message"] == 'Unauthorised' ||
        error.response?.data["message"] == 'Unauthorized') {
      showCustomDialog();
    }
    if (error.error is SocketException) {
      throw "Connection Failed";
    }

    var errorResponse = error.response;
    ErrorResponseModel errorObject =
    ErrorResponseModel.fromJson(errorResponse?.data);
    if (errorObject.status == 401) {

    }
    if (errorObject.status == 403) {
      throw SessionExpiredException();
    }
    if (errorResponse != null) {
      throw ApiResponseException(errorObject.message);
    } else {
      throw ApiResponseException("Failed");
    }
  }



  String getFileExtensionFromUrl(String fileUrl) {
    final Uri uri = Uri.parse(fileUrl);
    final String path = uri.path;
    final String extension = p.extension(path);
    return extension.isNotEmpty ? extension.substring(1) : '';
  }

  void showCustomDialog() {
    G.Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20), // This makes the dialog rectangular
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Session Expired",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 16),
              Text("Your session has expired. Please login again."),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Expanded(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(
                  //         shape:
                  //             MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10.0),
                  //             side: BorderSide(
                  //                 color: Colors.black), // Black border
                  //           ),
                  //         ),
                  //         backgroundColor:
                  //             MaterialStateProperty.all<Color>(Colors.white),
                  //       ),
                  //       onPressed: () {
                  //         G.Get.back();
                  //       },
                  //       child: Text(
                  //         'Cancel',
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, right: 30, bottom: 8.0, left: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          // G.Get.offAll(LoginScreen());
                          // Button 2 action
                          print("Button 2 pressed");
                        },
                        child: Text(
                          'Login Again',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SizedBox(
              //       width: 100,
              //       child: ElevatedButton(
              //         onPressed: () async {
              //           // Your logout logic here
              //           G.Get.back(); // Close the dialog
              //         },
              //         child: Text('Confirm'),
              //         style: ElevatedButton.styleFrom(
              //           shape: RoundedRectangleBorder(
              //             borderRadius:
              //                 BorderRadius.circular(0), // Rectangular shape
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 60,
              //       child: ElevatedButton(
              //         onPressed: () {
              //           G.Get.back(); // Close the dialog
              //         },
              //         child: Text('Cancel'),
              //         style: ElevatedButton.styleFrom(
              //           shape: RoundedRectangleBorder(
              //             borderRadius:
              //                 BorderRadius.circular(0), // Rectangular shape
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      barrierDismissible:
      false, // Set to true if you want the dialog to be dismissible by tapping outside of it.
    );
  }
}
