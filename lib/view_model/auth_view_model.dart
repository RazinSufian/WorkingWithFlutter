import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../repository/auth_repository.dart';
import '../routes/routes_name.dart';
import '../utils/components/utils.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  //signupApi
  Future<void> signupApi(dynamic data , BuildContext context) async {
    print("userdata $data");
    // Utils.showLoading(context);
    // _myRepo.signupApi(data).then((value){
    //
    //   // Utils.cancelLoading(context);
    //   Utils.flushBarErrorMessage(AppLocalizations.of(context)!.signupSuccessfully, Icons.check,Colors.green, context);
    //   if(kDebugMode){
    //     print(value.toString());
    //   }
    //   Navigator.pushNamed(context, RoutesName.varify_Otp);
    // }).onError((error, stackTrace){
    //   // Utils.cancelLoading(context);
    //   Utils.flushBarErrorMessage(error.toString(),Icons.error,Colors.red,  context);
    //   if(kDebugMode){
    //     print(error.toString());
    //   }
    //
    // });

    _myRepo.signupApi(data).then((value) async {
      try {
        // Assuming value is a Response object
        final responseJson = jsonDecode(value.body.toString());
        print("Response: $responseJson");

        // Assuming the response contains an HTTP status code
        if (value.statusCode == 200 || value.statusCode == 201) {
          print("Signup successful: $responseJson");
          // Utils.flushBarErrorMessage(
          //   AppLocalizations.of(context)!.signupSuccessfully,
          //   Icons.check,
          //   Colors.green,
          //   context,
          // );
          if (kDebugMode) {
            print(value.toString());
          }
          // Navigator.pushNamed(context, RoutesName.varify_Otp);
        } else {
          // Extract the error message from the response body
          String errorMessage = responseJson['body'] != null && responseJson['body']['error'] != null
              ? responseJson['body']['error']
              : "User already exists";

          print("Error: $errorMessage");
          Utils.flushBarErrorMessage(
            errorMessage,
            Icons.error,
            Colors.red,
            context,
          );
        }
      } catch (error) {
        print("error: $error");
        // Handle general errors
        Utils.flushBarErrorMessage(
          error.toString(),
          Icons.error,
          Colors.red,
          context,
        );
        if (kDebugMode) {
          print(error.toString());
        }
      }
    });
  }

  // Future<void> signInApi(dynamic data , BuildContext context) async {
  //   // Utils.showLoading(context);
  //   _myRepo.signInApi(data).then((value){
  //
  //     final userPreference = Provider.of<UserViewModel>(context , listen: false);
  //
  //     User user = User.fromJson(value['body']);
  //
  //     print("valueData-- ${value['body']}");
  //     print("valueData-- ${user.user_id}");
  //     print("valueData-- ${user.id_token}");
  //
  //     userPreference.saveUser(
  //         UserModel(
  //             body:  user
  //         )
  //     );
  //
  //     // Utils.cancelLoading(context);
  //     Utils.flushBarErrorMessage(AppLocalizations.of(context)!.loginSuccessfully, Icons.check,Colors.green, context);
  //     if(kDebugMode){
  //       print(value.toString());
  //     }
  //     Navigator.pushNamedAndRemoveUntil(context, RoutesName.menu, (route)=> false);
  //   }).onError((error, stackTrace){
  //     // Utils.cancelLoading(context);
  //     Utils.flushBarErrorMessage(error.toString(),Icons.error,Colors.red,  context);
  //     if(kDebugMode){
  //       print(error.toString());
  //     }
  //
  //   });
  // }

  // Future<dynamic> otpVerificationApi(dynamic data , BuildContext context)async{
  //   _myRepo.otpVerificationApi(data).then((value){
  //
  //     // Utils.cancelLoading(context);
  //     if(kDebugMode){
  //       print(value.toString());
  //     }
  //     Navigator.pushNamedAndRemoveUntil(context, RoutesName.auth, (route)=> false);
  //     Utils.flushBarErrorMessage("wait for admin", Icons.check,Colors.green, context);
  //   }).onError((error, stackTrace){
  //     // Utils.cancelLoading(context);
  //     Utils.flushBarErrorMessage(error.toString(),Icons.error,Colors.red,  context);
  //     if(kDebugMode){
  //       print(error.toString());
  //     }
  //
  //   });
  //
  // }


}