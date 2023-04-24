import 'package:corona_api/Model/corona_model.dart';
import 'package:flutter/widgets.dart';
import '../Utils/api_helper.dart';

class HomeProvider extends ChangeNotifier {
  Future<CoronaModel> getCoronaData() async {
    Apihelper apihelper = Apihelper();
    CoronaModel coronaModel = await apihelper.getCoronaApi();
    return coronaModel;
  }
}
