class ApiUrl {
  static const String webBaseUrl = 'https://idv1.nina.vn';
  static const String fileCustomerRequests =
      '$webBaseUrl/upload/file/customer_requests/';

  static const String protocol = 'http://v1.nina.vn';

  static const String port = '';
  static const String baseUrl = '$protocol$port/dev';
  static const String mediaUrl = '$protocol$port/';

  static const String apiUrlGetServices =
      'https://demoapi.nina.com.vn:8443/api/v2/public-api';

  static const String getSetting = 'https://idv1.nina.vn/dev/setting';

  // Auth
  static const String generateToken = '$baseUrl/generateToken';
  static const String signIn = '$baseUrl/loginCustomer';
  static const String infoUser = '$baseUrl/getCustomerInfo';
  static const String sendMailForgotPassword =
      '$baseUrl/sendMailForgotPassword';
  static const String updateCustomerById = '$baseUrl/updateCustomerById';
  static const String changePassword = '$baseUrl/changePassword';

  // Liên hệ
  static const String getDetailStaticByType =
      '$baseUrl/getDetailStaticByType'; // ?type=lienhe

  // Phòng ban
  static const String getDepartments = '$baseUrl/getDepartments';

  // gửi form yêu cầu
  static const String createCustomerRequest = '$baseUrl/createCustomerRequest';

  // gửi phản hồi
  static const String createHistoryCustomerRequests =
      '$baseUrl/createHistoryCustomerRequests';

  // update trạng thái yêu cầu
  static const String updateStatusCustomerRequest =
      '$baseUrl/updateStatusCustomerRequest';

  // tất cả phản hồi của yêu cầu
  static const String getHistoryCustomerRequest =
      '$baseUrl/getHistoryCustomerRequest';

  // chi tiết yêu cầu hỗ trợ
  static const String getDetailCustomerRequest =
      '$baseUrl/getDetailCustomerRequest';

  // upload file đính kèm của yêu cầu
  static const String attachedFilesCustomerRequest =
      '$baseUrl/attachedFilesCustomerRequest';

  // danh sách các yêu cầu hỗ trợ đã gửi
  static const String getCustomerRequest = '$baseUrl/getCustomerRequest';

  // Place
  static const String danhSachTinhThanh = '$baseUrl/getPlaceCity';
  static const String danhSachQuanHuyen = '$baseUrl/getPlaceDistrictByCityId';
  static const String danhSachPhuongXa = '$baseUrl/getPlaceWardByDistrictId';

  // List Domain
  static const String dsDomain = '$baseUrl/checkDomainByEmail';
  static const String checkDateDomain = '$baseUrl/checkDateDomain';
  static const String sendMailGetDomain = '$baseUrl/sendMailGetDomain';

  // List Hosting
  static const String dsHosting = '$baseUrl/checkHostingByEmail';
  static const String sendMailGetHosting = '$baseUrl/sendMailGetHosting';

  // danh sách các gói hosting
  static const String danhSachGoiHosting = '$baseUrl/checkPriceListHosting';

  // List Website
  static const String dsWebsite = '$baseUrl/checkWebsiteByEmail';

  // List Orders
  static const String getOrdersByUser = '$baseUrl/getOrdersByUser';
  static const String getConfigStatus = '$baseUrl/getConfigStatus';
  static const String getOrderDetailById = '$baseUrl/getOrderDetailById';
  static const String updateStatusOrder = '$baseUrl/updateStatusOrder';

  // gửi form yêu cầu NC WEBSITE

  static const String createContact = '$baseUrl/createContact';
}
