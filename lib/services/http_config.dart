// http_config.dart 文件中主要配置请求相关的一些公共配置

// 请求服务器地址
// const String baseUrl = 'https://www.fastmock.site/mock/8279d14ec2f5e5fb1f521b7fd2f77edc/msdb/';
const String baseUrl = 'http://49.232.124.98/';
// http://49.232.124.98:8888/servers_data_handle/
// 请求连接
const Map urlPath = {
  'ms_qa_query': '/ms_qa_query',
  'article_query': '/article_query',
};

// content-type
const Map contentType = {
  'json': "application/json",
  'form': "application/x-www-form-urlencoded"
};
