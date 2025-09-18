import 'package:perfume_shop/data/models/home_page_model.dart';
import 'package:perfume_shop/data/models/login_model.dart';
import 'package:perfume_shop/utils/constants.dart';
import 'package:perfume_shop/utils/network/api_base_helper.dart';

class Repository {
  Future<LoginModel> login(String deviceToken, String deviceType) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    var body = {"device_token": deviceToken, "device_type": deviceType};
    var result = await apiBaseHelper.formPost(Constants.logInAnonymous, body);

    var user = LoginModel.fromJson(result);
    return user;
  }

  Future<HomePageModel> getHomeData() async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();

    var result = await apiBaseHelper.get(Constants.homeData);

    var homedata = HomePageModel.fromJson(result);
    return homedata;
  }
}
