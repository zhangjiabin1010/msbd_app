import 'package:dio/dio.dart';

void main() async {
  var response = await Dio().get(
      'https://www.fastmock.site/mock/8279d14ec2f5e5fb1f521b7fd2f77edc/msdb/ms_answer_show_2');
  print(response.data);
}
