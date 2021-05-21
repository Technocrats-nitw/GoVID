import 'package:technocrats/services/client/service_res.dart';
import 'package:technocrats/constants.dart';
import 'package:technocrats/utils/exceptions.dart';
import 'package:velocity_x/velocity_x.dart';

abstract class APIEffects implements VxEffects<MappedServiceResponse<dynamic>> {
  @override
  fork(result) {
    try {
      if (result.networkServiceResponse.success) {
        success(result.mappedResult);
      } else {
        final error =
            result.networkServiceResponse?.message ?? Constants.wentWrong;
        fail(error);
        throw AppException(error);
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  void success(dynamic result);
  void fail(String message);
}
