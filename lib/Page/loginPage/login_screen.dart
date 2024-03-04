import 'package:clone_app_tiktok/Page/loginPage/loginWithGoogle.dart';
import 'package:clone_app_tiktok/Route/App_Route.dart';
import 'package:clone_app_tiktok/provider/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../Animations/AnimationsPage.dart';
import '../../main.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    Provider.of<GlobalState>(context, listen: true).isLogin == false
        ? WidgetsBinding.instance
            .addPostFrameCallback((_) => ShowModalBottomSheet(context))
        : null;
    return SlideTransitionScreen(
      child: Column(
        children: [
          Container(
            height: 45,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(50),
                GestureDetector(
                  onTap: null,
                  child: Text(
                    AppRoute.router.location == '/mail' ? 'Hộp thư' : 'Hồ sơ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.menu_sharp,
                    color: Colors.black,
                  ),
                  iconSize: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/register_user.svg',
                  width: 70,
                  height: 70,
                  color: const Color(0xff9c9c9c),
                ),
                const Gap(20),
                const Text('Đăng kí tài khoản', style: TextStyle(fontSize: 16)),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    ShowModalBottomSheet(context);
                  },
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(220, 45),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xfffe2c55),
                    ),
                  ),
                  child: const Text(
                    'Đăng kí',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Gap(62),
        ],
      ),
    );
  }
}

void ShowModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
    ),
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (BuildContext context) {
      return const registerAccout();
    },
  );
}

Widget LoginWith(String logoImage, String loginWith) {
  return Container(
    alignment: Alignment.center,
    width: 350,
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(3)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: 40,
          height: 25,
          child: Image.asset(logoImage),
        ),
        Text(
          loginWith,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Gap(30)
      ],
    ),
  );
}

//
class registerAccout extends StatefulWidget {
  const registerAccout({super.key});

  @override
  State<registerAccout> createState() => _registerAccoutState();
}

class _registerAccoutState extends State<registerAccout> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mq.height - 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // header
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, size: 25)),
                isEnabled
                    ? const Text('Đăng kí TikTok',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                    : const SizedBox(),
                IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      'assets/svg/question.svg',
                      width: 24,
                      height: 24,
                      color: const Color(0xff9c9c9c),
                    )),
              ],
            ),
          ),
          //body
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notificationScroll) {
                setState(() {
                  isEnabled = notificationScroll.metrics.pixels > 61;
                });
                return false;
              },
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(30),
                      const Text(
                        'Đăng kí TikTok',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      const Gap(15),
                      const Text(
                        'Quản lý tài khoản, kiểm tra thông báo, bình luận',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9c9c9c),
                        ),
                      ),
                      const Text(
                        'trên các video, v.v.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9c9c9c),
                        ),
                      ),
                      const Gap(30),
                      GestureDetector(
                        onTap: () async {
                          await loginWithGoogle.signInWithGoogle();

                          if (context.mounted) {
                            Provider.of<GlobalState>(context, listen: false)
                                .setIsLogin(true);
                            // print(
                            //     'islogin: ${Provider.of<GlobalState>(context, listen: false).isLogin}');
                            // print('nameRoute:  ${AppRoute.router.location}');
                            // print(
                            //     'index:  ${context.read<GlobalState>().indexPage}');
                            Navigator.pop(context);

                            context.go('/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login failed'),
                              ),
                            );
                          }
                        },
                        child: LoginWith('assets/img/login/googleLogo.png',
                            'Tiếp tục với Google'),
                      ),
                      const Gap(15),
                      LoginWith('assets/img/login/personLogo.png',
                          'Số điện thoại / Email / Tiktok ID'),
                      const Gap(15),
                      LoginWith('assets/img/login/facebookLogo.png',
                          'Tiếp tục Facebook'),
                      const Gap(15),
                      LoginWith('assets/img/login/intargramLogo.png',
                          'Tiếp tục với Intargram'),
                      const Gap(15),
                      LoginWith('assets/img/login/twitterLogo.png',
                          'Tiếp tục với Twitter'),
                      const Gap(15),
                      LoginWith(
                          'assets/img/login/lineLogo.png', 'Tiếp tục với LINE'),
                      const Gap(30),
                    ]),
              ),
            ),
          ),
          // footer
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(15),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                constraints: const BoxConstraints(maxWidth: 332),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Bằng cách tiếp tục, bạn đồng ý với  ',
                    style: TextStyle(fontSize: 14, color: Colors.black38),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Điều khoản Dịch vụ ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: 'của chúng tôi và thừa nhận rằng bạn đã đọc '),
                      TextSpan(
                        text: 'Chính sách Quyền riêng tư ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text:
                              'để tìm hiểu cách chúng tôi thu nhập, sử dụng và chia sẻ dữ liệu của bạn.'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                color: const Color(0xfff1f1f1),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn không có tài khoản?',
                        style: TextStyle(fontSize: 18)),
                    Text(
                      ' Đăng kí',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
