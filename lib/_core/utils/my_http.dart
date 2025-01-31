// API 서버의 기본 URL 설정
// 집 기본 API 주소
// 그린 로컬 컴퓨터 기본 API 주소
// 전역 변수
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final baseUrl = 'http://192.168.0.115:8080';

// 전역 변수
final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    // 요청 데이터 형식을 json 으로 지정하겠다.
    contentType: 'application/json; charset=utf-8',
    // 필수 !! --> dio 는 200번 상태 코드 값이 아니면 무조건 오류로 간주함
    // true 로 설정하면 다른 상태 코드 값도 모두 허용한다. ex) 201, 202 등
    validateStatus: (status) => true,
  ),
);

// 중요 데이터 보관소 ( 금고 )
// 민감한 데이터를 보관하는 안전한 금고 역할을 한다.
const secureStorage = FlutterSecureStorage();
