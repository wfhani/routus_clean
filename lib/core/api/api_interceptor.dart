// import 'package:dio/dio.dart';
// import 'package:shared_project/cache/cache_helper.dart';
// import 'package:shared_project/core/api/end_ponits.dart';
//
// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     options.headers[ApiKey.token] =
//     CacheHelper().getData(key: ApiKey.token) != null
//         ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
//         : null;
//     super.onRequest(options, handler);
//   }
// }