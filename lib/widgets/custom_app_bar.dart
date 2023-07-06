import 'package:flutter/material.dart';
import 'package:netflix_clone_flutter/assets.dart';
import 'package:netflix_clone_flutter/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 24.0,
      ),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: const Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(title: 'Home', onTap: () => debugPrint('Home')),
                AppBarButton(
                    title: 'TV Shows', onTap: () => debugPrint('TV Shows')),
                AppBarButton(
                    title: 'Movies', onTap: () => debugPrint('Movies')),
                AppBarButton(
                    title: 'Latest', onTap: () => debugPrint('Latest')),
                AppBarButton(title: 'My List', onTap: () => debugPrint('List')),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => debugPrint('Search'),
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
                AppBarButton(
                    title: 'KIDS', onTap: () => debugPrint('KIDS')),
                AppBarButton(
                    title: 'DVD', onTap: () => debugPrint('DVD')),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => debugPrint('Gift'),
                  icon: const Icon(Icons.card_giftcard),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => debugPrint('Notification'),
                  icon: const Icon(Icons.notifications),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                    title: 'TV Shows', onTap: () => debugPrint('TV Shows')),
                AppBarButton(
                    title: 'Movies', onTap: () => debugPrint('Movies')),
                AppBarButton(title: 'My List', onTap: () => debugPrint('List')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
