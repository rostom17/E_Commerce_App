class Urls {
  static const _baseUrl = "https://ecommerce-api.codesilicon.com/api";

  static const sliderProductListURL = "$_baseUrl/ListProductSlider";
  static const categoryListURL = "$_baseUrl/CategoryList";
  static const brandListURL = "$_baseUrl/BrandList";

  static const _productListByRemark = "$_baseUrl/ListProductByRemark";
  static const productListByRemark_Popular_URL = "$_productListByRemark/popular";
  static const productListByRemark_New_URL = "$_productListByRemark/new";
  static const productListByRemark_Regular_URL = "$_productListByRemark/regular";

  static const emailVerificationURL = "$_baseUrl/UserLogin/";
  static const otpVerificationURL = "$_baseUrl/VerifyLogin/";
}