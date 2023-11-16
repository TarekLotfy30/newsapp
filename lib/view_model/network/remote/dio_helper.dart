import 'package:dio/dio.dart';
import 'package:newsapp/view_model/network/remote/constants.dart';

// ana lama afta7 el app w astad3y el dio helper dy . init hay2om me3rfly el dio dah

class DioHelper {
  // 1 - e3ml object mn el dio
  static Dio? dio;

  //2-3ayz a3ml create ly el object dah fe  method
  static init() {
    //ebda2 3araf el dio w a3mlo creation
    //gwa el constructor fe haga esmha baseoptions w dah ely bakteb feh el url beta3y
    //                w kman ba2olo hatly el data hata lw fe status error
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //4- method ly el get data
  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      path,
      queryParameters: query,
    );
    //hastkhdem el dio el soghnon el variable
    //el get mehtag path (methodUrl) ,,, w el getdata dy method ana hastd3eha
    //       w aked el path da haytgher mn makan ly makan fa ha7oto ka parameter

    // el get betreturn future response fa ana msh haynfa3 a3ml return ly void
    //   ha7welha ly future w response dah ely hast2bel meno el data

    // w a3mlha static kaman 3lshan a3ml accesss 3ala tol be el dio helper
  }
}

//3- aro7 ly el main w astad3y el dio helper
