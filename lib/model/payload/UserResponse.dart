import '../BetCoefficient.dart';
import '../User.dart';
import '../Wager.dart';
import 'BaseResponse.dart';

class UserResponse extends BaseResponse {
  final User user;

  UserResponse({this.user}) : super.name('', '');

  factory UserResponse.fromJson(dynamic json) {
    User parsedUser = User.fromJson(json);

    return UserResponse(
      user: parsedUser,
    );
  }

  factory UserResponse.parseErrorResponse(Map<String, dynamic> json) {
    UserResponse response = UserResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}
