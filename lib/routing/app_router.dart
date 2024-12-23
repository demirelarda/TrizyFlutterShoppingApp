import 'package:go_router/go_router.dart';
import 'package:trizy_app/views/address/my_addresses_page.dart';
import 'package:trizy_app/views/checkout/checkout_page.dart';
import 'package:trizy_app/views/main/main_page.dart';
import 'package:trizy_app/views/main/pages/cart_page.dart';
import 'package:trizy_app/views/product/product_details_page.dart';
import 'package:trizy_app/views/search/search_page.dart';
import 'package:trizy_app/views/splash/splash_page.dart';
import '../models/address/address.dart';
import '../views/address/address_form_page.dart';
import '../views/auth/login_page.dart';
import '../views/auth/signup_page.dart';
import '../views/onboarding/onboarding_page.dart';
import '../views/product/product_list_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
    initialLocation: '/mainPage',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: 'mainPage',
        path: '/mainPage',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        name: 'search',
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        name: 'productListPageWithCategory',
        path: '/productListPage/:categoryId/:categoryName',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId'];
          final categoryName = state.pathParameters['categoryName'];
          return ProductListPage(categoryId: categoryId, categoryName: categoryName, query: null);
        },
      ),
      GoRoute(
        name: 'productListPageWithQuery',
        path: '/productListPage',
        builder: (context, state) {
          final query = state.uri.queryParameters['query'];
          return ProductListPage(categoryId: null, categoryName: null, query: query);
        },
      ),
      GoRoute(
        name: 'productDetailsPage',
        path: '/productDetailsPage/:productId',
        builder: (context, state) {
          final productId = state.pathParameters['productId'];
          return ProductDetailsPage(productId: productId!);
        },
      ),
      GoRoute( //TODO: MAKE CART PAGE COMPATIBLE WITHOUT BOTTOM BAR OR DIRECTLY GO TO MAIN PAGE AND SELECT CART PAGE FROM BOTTOM BAR.
        name: 'cart',
        path: '/cart',
        builder: (context, state) {
          return const CartPage();
        },
      ),
      GoRoute(
        name: 'checkoutPage',
        path: '/checkoutPage',
        builder: (context, state) {
          return const CheckoutPage();
        },
      ),
      GoRoute(
        name: 'myAddresses',
        path: '/myAddresses',
        builder: (context, state) {
          return const MyAddressesPage();
        },
      ),

      GoRoute(
        name: 'addressForm',
        path: '/addressForm',
        builder: (context, state) {
          final address = state.extra as Address?;
          return AddressFormPage(address: address);
        },
      ),

    ],
  );
}