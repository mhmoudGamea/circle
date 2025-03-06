import 'package:circle/data/datasource/remote/dio/dio_client.dart';

class BaseCategoryRepository {
  final DioClient dioClient;

  BaseCategoryRepository({required this.dioClient});
}
