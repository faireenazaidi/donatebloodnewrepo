

import 'package:donationdiversity/UserInfo/userInfoBinding.dart';
import 'package:donationdiversity/UserInfo/userInfoView.dart';
import 'package:donationdiversity/signUp/signUp.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Category/category_View.dart';
import '../Category/category_binding.dart';
import '../ChangePassword/changePassBinding.dart';
import '../ChangePassword/changepassView.dart';
import '../Dashboard/dashboard.view.dart';
import '../Dashboard/dashboardBinding.dart';
import '../Login/login_bining.dart';
import '../Login/login_view.dart';
import '../Profile/profileBinding.dart';
import '../Profile/profileView.dart';
import '../SplashScreen/splashBinding.dart';
import '../SplashScreen/splashView.dart';
import '../createPassword/password_Bining.dart';
import '../createPassword/password_View.dart';
import '../signUp/signUpBinding.dart';


class AppRoutes {
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String passwordRoute = '/password';
  static const String userInfoRoute = '/userInfo';
  static const String dashboardRoute = '/dashboard';
  static const String categoryRoute = '/category';
  static const String changePassRoute = '/changePass';
  static const String profileView = '/profile';
  static const String splashScreen = '/splash';

  static List<GetPage> pages = [
    GetPage(
      name: loginRoute,
      page: () =>   LoginView(),
      bindings: [LoginBinding()],
    ),

    GetPage(
      name: signUpRoute,
      page: () =>   SignUpView(),
      bindings: [SignBinding()],
    ),
    GetPage(
      name: passwordRoute,
      page: () =>   PasswordView(),
      bindings: [PasswordBinding()],
    ),
    GetPage(
        name: userInfoRoute,
        page:()=> UserInfoView(),
        bindings: [UserInfoBinding()]
    ),
    GetPage(
        name: dashboardRoute,
        page:()=> DashboardView(),
        bindings: [DashboardBinding()]
    ),
      GetPage(
          name: categoryRoute,
          page: ()=> CategoryView(),
        bindings: [CategoryBinding()]
      ),
    GetPage(
        name: changePassRoute,
        page: ()=>  ChangePassView(),
      bindings: [ChangePassBinding()]
    ),
    GetPage(
      name: profileView,
      page:()=> ProfileView(),
      bindings: [ProfileViewBinding()]
    ),
    GetPage(
        name: splashScreen,
        page: ()=> SplashScreen(),
  bindings: [SplashBinding()]
    ),

  ];
}

