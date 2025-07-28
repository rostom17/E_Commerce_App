class Urls {
  static const _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static const sliderProductListURL = "$_baseUrl/slides";
  static const categoryListURL = "$_baseUrl/categories";
  static const brandListURL = "$_baseUrl/brands";

  static const _productListByRemark = "$_baseUrl/ListProductByRemark";
  static const productListByRemarkPopularURL = "$_productListByRemark/popular";
  static const productListByRemarkNewURL = "$_productListByRemark/new";
  static const productListByRemarkRegularURL = "$_productListByRemark/regular";

  static const loginURL = "$_baseUrl/auth/login";
  static const otpVerificationURL = "$_baseUrl/VerifyLogin/";
  static const logoutURL = "$_baseUrl/logout/";

  static const readProfileURL = "$_baseUrl/ReadProfile";
  static const createProfileURL = "$_baseUrl/CreateProfile";

  static const productReview = "$_baseUrl/ListReviewByProduct/";

  static const createCartListURL = "$_baseUrl/CreateCartList";
  static const readCartList = "$_baseUrl/CartList";
  static const readWishList = "$_baseUrl/ProductWishList";
  static const createWishList = "$_baseUrl/CreateWishList/";

  static RegExp emailChecker = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
