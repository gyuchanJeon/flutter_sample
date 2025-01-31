import 'package:dio/dio.dart';

import '../../_core/utils/logger.dart';
import '../../_core/utils/my_http.dart';

class UserRepository {
  // 회원가입 요청 ( CRUD 기반 네이밍 )
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> reqData) async {
    // 전역 변수 안에 옵션값 설정되어 있는 객체를 들고 옴 ( dio )
    Response response = await dio.post('/join', data: reqData);

    // 규칙 1 Repository 영역에서는 응답 HTTP 전체를 받아서
    // 가능한 뷰 모델에 HTTP Body 영역만 던져주자.
    // response.header, <-- header 부분 / response.data <-- body 부분
    Map<String, dynamic> responseBody = response.data;
    logger.e(responseBody);
    return responseBody;
  }

  // 사용자의 이름과 비밀번호 확인 요청
  // 레코드 문법으로 변환
  Future<(Map<String, dynamic>, String)> readUser(
      Map<String, dynamic> reqData) async {
    Response response = await dio.post('/login', data: reqData);
    Map<String, dynamic> responseBody = response.data;
    // JWT
    String accessToken = '';
    // JWT 토큰 파싱
    try {
      logger.i('JWT 토큰 확인 : ${response.headers['Authorization']?[0]}');
      accessToken = response.headers['Authorization']![0];
    } catch (e) {
      // 모든 예외를 잡을 수 있다.
      logger.e('JWT 파싱 오류');
    }

    // 레코드 문법
    // 1. 위치 기반 레코드 문법 / 2. 명명 기반 레코드 문법
    return (responseBody, accessToken);
  }
}
