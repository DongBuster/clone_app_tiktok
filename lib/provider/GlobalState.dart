// import 'package:flutter/material.dart';

// class GlobalState extends ChangeNotifier {
//   // handle login
//   bool isLogin = false;
//   void setIsLogin(bool value) {
//     isLogin = value;
//     notifyListeners();
//   }

//   //handle AnimationPage
//   int indexPage = 0;
//   bool isAnimationToLeftToRight = false;

//   void setIndexPage(int index) {
//     switch (index) {
//       case 0:
//         isAnimationToLeftToRight = true;
//         break;
//       case 4:
//         isAnimationToLeftToRight = false;
//         break;
//       default:
//         if (index > indexPage) {
//           isAnimationToLeftToRight = true;
//         } else {
//           isAnimationToLeftToRight = false;
//         }
//     }
//     indexPage = index;
//     notifyListeners(); // thông báo cho các widget khác biết rằng trạng thái đã thay đổi
//   }
// }
