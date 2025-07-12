import 'package:mubasher_app/features/auth/presentation/views/components/auth_export_file.dart';
import 'package:mubasher_app/features/profile/presentation/views/profile_options_view.dart';
import 'package:mubasher_app/features/home/views/components/custom_home_view.dart';
import 'package:mubasher_app/features/favorite/views/favorite_view.dart';
import 'package:mubasher_app/features/search/views/search_view.dart';
import 'package:mubasher_app/features/chat/views/chat_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const CustomHomeView(),
    const SearchView(),
    const ChatView(),
    const FavoriteView(),
    const ProfileOptionsView(),
  ];

  final List<String> _iconPaths = [
    SvgImagesManager.home2,
    SvgImagesManager.search,
    SvgImagesManager.chatOutlineIcon,
    SvgImagesManager.heart2,
    SvgImagesManager.profile,
  ];

  final List<String> _dotPaths = [
    SvgImagesManager.dotIcon,
    SvgImagesManager.dotIcon,
    SvgImagesManager.dotIcon,
    SvgImagesManager.dotIcon,
    SvgImagesManager.dotIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFFb8934d),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(5, (index) {
          return BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  _iconPaths[index],
                  height: 2.8.h,
                  width: 2.8.h,
                ),
                if (_currentIndex == index)
                  Positioned(
                    bottom: -6,
                    child: SvgPicture.asset(
                      _dotPaths[index],
                      height: 1.0.h,
                      width: 1.0.h,
                    ),
                  ),
              ],
            ),
            label: '',
          );
        }),
      ),
    );
  }
}
