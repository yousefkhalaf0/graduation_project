import 'package:flutter/material.dart';
import 'package:graduation_project/core/router/routes.dart';
import 'package:graduation_project/features/profile/view/screens/edit_profile_screen.dart';
import 'package:graduation_project/features/profile/view/screens/wishlist_screen.dart';
import '../../features/auth/create_acc_screen/view/screens/create_acc_screen.dart';
import '../../features/auth/forgot_password/create_new_pass_screen/view/screens/create_new_pass_screen.dart';
import '../../features/auth/forgot_password/email_otp_screen/view/screens/email_otp_screen.dart';
import '../../features/auth/forgot_password/forget_by_email_screen/view/screens/forget_by_email_screen.dart';
import '../../features/auth/forgot_password/forget_by_phone_screen/view/screens/forget_by_phone_screen.dart';
import '../../features/auth/forgot_password/phone_otp_screen/view/screens/phone_otp_screen.dart';
import '../../features/auth/login_screen/view/screens/login_screen.dart';
import '../../features/cart_screen/view/screens/cart_screen.dart';
import '../../features/cart_screen/view/screens/checkout_screen.dart';
import '../../features/cart_screen/view/screens/place_order_screen.dart';
import '../../features/categories_screen/model/categories_model.dart';
import '../../features/categories_screen/view/screens/categories_screen.dart';
import '../../features/home_screen/model/home_model.dart';
import '../../features/products_view_screen/model/category_products_model.dart';
import '../../features/products_view_screen/view/screens/product_details_screen.dart';
import '../../features/products_view_screen/view/screens/products_view_screen.dart';
import '../../features/profile/view/screens/help_screen.dart';
import '../../features/home_layout/view/screens/home_layout_screen.dart';
import '../../features/home_screen/view/screens/home_screen.dart';
import '../../features/on_boarding_screen/view/screens/on_boarding_screen.dart';
import '../../features/profile/view/screens/inbox_screen.dart';
import '../../features/profile/view/screens/notification_screen.dart';
import '../../features/profile/view/screens/orders_screen.dart';
import '../../features/profile/view/screens/pending_reviews_screen.dart';
import '../../features/profile/view/screens/profile_screen.dart';
import '../../features/profile/view/screens/recently_searched_screen.dart';
import '../../features/profile/view/screens/recently_viewed_screen.dart';
import '../../features/search_screen/view/screens/search_screen.dart';
import '../../features/splash_screen/view/screens/splash_screen.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashScreenRoute:
      return MaterialPageRoute(builder: (_) => const Splash());
    case AppRoutes.onBoardingScreenRoute:
      return MaterialPageRoute(builder: (_) => const OnBoarding());
    case AppRoutes.loginScreenRoute:
      return MaterialPageRoute(builder: (_) => const LogIn());
    case AppRoutes.createAccScreenRoute:
      return MaterialPageRoute(builder: (_) => const CreateAcc());
    case AppRoutes.forgetByEmailScreenRoute:
      return MaterialPageRoute(builder: (_) => const ForgetByEmail());
    case AppRoutes.forgetByPhoneScreenRoute:
      return MaterialPageRoute(builder: (_) => const ForgetByPhone());
    case AppRoutes.emailOTPScreenRoute:
      return MaterialPageRoute(builder: (_) => const EmailOTP());
    case AppRoutes.phoneOTPScreenRoute:
      return MaterialPageRoute(builder: (_) => const PhoneOTP());
    case AppRoutes.createNewPassScreenRoute:
      return MaterialPageRoute(builder: (_) => const CreateNewPass());
    case AppRoutes.homeScreenRoute:
      return MaterialPageRoute(builder: (_) => const Home());
    case AppRoutes.categoriesScreenRoute:
      return MaterialPageRoute(builder: (_) => const Categories());
    case AppRoutes.productsViewScreenRoute:
      final arg = routeSettings.arguments as CategoriesModel;
      return MaterialPageRoute(
          builder: (_) => ProductsView(categoriesModel: arg));
    case AppRoutes.cartScreenRoute:
      return MaterialPageRoute(builder: (_) => const Cart());
    case AppRoutes.searchScreenRoute:
      return MaterialPageRoute(builder: (_) => const Search());
    case AppRoutes.profileScreenRoute:
      return MaterialPageRoute(builder: (_) => const Profile());
    case AppRoutes.homeLayoutScreenRoute:
      return MaterialPageRoute(builder: (_) => const HomeLayout());
    case AppRoutes.helpScreenRoute:
      return MaterialPageRoute(builder: (_) => const Help());
    case AppRoutes.editProfileScreenRoute:
      return MaterialPageRoute(builder: (_) => const EditProfile());
    case AppRoutes.wishListScreenRoute:
      return MaterialPageRoute(builder: (_) => const WishList());
    case AppRoutes.inboxScreenRoute:
      return MaterialPageRoute(builder: (_) => const Inbox());
    case AppRoutes.ordersScreenRoute:
      return MaterialPageRoute(builder: (_) => const Orders());
    case AppRoutes.recentlyViewScreenRoute:
      return MaterialPageRoute(builder: (_) => const RecentlyView());
    case AppRoutes.pendingReviewsScreenRoute:
      return MaterialPageRoute(builder: (_) => const PendingReviews());
    case AppRoutes.notificationScreenRoute:
      return MaterialPageRoute(builder: (_) => const NotificationScreen());
    case AppRoutes.recentlySearchedScreenRoute:
      return MaterialPageRoute(builder: (_) => const RecentlySearched());
    case AppRoutes.productDetailsScreenRoute:
      final args = routeSettings.arguments;

      CategoryProductsModel? categoryProductsModel;
      HomeProductsModel? homeProductsModel;
      // CategoriesModel categoriesModel;

      if (args is CategoryProductsModel) {
        categoryProductsModel = args;
      } else if (args is HomeProductsModel) {
        homeProductsModel = args;
      }

      return MaterialPageRoute(
        builder: (_) => ProductDetails(
          categoryProductsModel: categoryProductsModel,
          homeProductsModel: homeProductsModel,
          // categoriesModel: ,
        ),
      );
    case AppRoutes.checkoutScreenRoute:
      return MaterialPageRoute(builder: (_) => const Checkout());
    case AppRoutes.placeOrderScreenRoute:
      return MaterialPageRoute(builder: (_) => const PlaceOrder());
  }
  return null;
}
