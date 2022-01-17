// http_config.dart 文件中主要配置请求相关的一些公共配置

// 请求服务器地址
const String baseUrl =
    'https://www.fastmock.site/mock/8279d14ec2f5e5fb1f521b7fd2f77edc/msdb/';

// 请求连接
const Map urlPath = {
  'ms_question_show': '/ms_question_show',
  'ms_answer_show': '/ms_answer_show',
};

// content-type
const Map contentType = {
  'json': "application/json",
  'form': "application/x-www-form-urlencoded"
};
