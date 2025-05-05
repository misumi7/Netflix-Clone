import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomMenu extends StatefulWidget{
  BottomMenu({super.key, required this.currentPageIndex, required this.onPageSelected});

  final Function(int) onPageSelected;
  int currentPageIndex;

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UnderlinedIconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(1);
            },
            isSelected: widget.currentPageIndex == 1,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          UnderlinedIconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(0);
            },
            isSelected: widget.currentPageIndex == 0,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          UnderlinedIconButton(
            icon: Icon(
              Icons.movie,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(2);
            },
            isSelected: widget.currentPageIndex == 2,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          UnderlinedIconButton(
            icon: Icon(
              Icons.live_tv,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(3);
            },
            isSelected: widget.currentPageIndex == 3,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          UnderlinedIconButton(
            icon: Icon(
              Icons.bookmark_added,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(4);
            },
            isSelected: widget.currentPageIndex == 4,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          UnderlinedIconButton(
            icon: Icon(
              Icons.trending_up_rounded,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.04,
            ),
            onPressed: () {
              widget.onPageSelected(5);
            },
            isSelected: widget.currentPageIndex == 5,
          ),
        ],
      ),
    );
  }
}

class UnderlinedIconButton extends StatefulWidget {
  const UnderlinedIconButton({super.key, this.isSelected = false, required this.icon, required this.onPressed});
  final Icon icon;
  final bool isSelected;
  final Function() onPressed;

  @override
  State<UnderlinedIconButton> createState() => _UnderlinedIconButtonState();
}

class _UnderlinedIconButtonState extends State<UnderlinedIconButton>{
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
        height: MediaQuery.of(context).size.height * 0.052,
        child: IconButton(
          icon: widget.icon,
          onPressed: () {
            widget.onPressed();
          },
        ),
    ),
        Container(
          height: MediaQuery.of(context).size.height * 0.003,
          width: widget.isSelected ? MediaQuery.of(context).size.width * 0.089 : 0,
          color: Colors.red,
          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.001),
        ),
      ],
    );
  }
}

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({super.key, required this.onPageSelected});

  final Function(int) onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.07,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.075,
              height: MediaQuery.of(context).size.height * 0.075,
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    onPageSelected(1);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    onPageSelected(0);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.movie),
                  onPressed: () {
                    onPageSelected(2);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.live_tv),
                  onPressed: () {
                    onPageSelected(3);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.bookmark_added),
                  onPressed: () {
                    onPageSelected(4);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                AnimatedUnderlinedIconButton(
                  icon: const Icon(Icons.trending_up_rounded),
                  onPressed: () {
                    onPageSelected(5);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedUnderlinedIconButton extends StatefulWidget{
  const AnimatedUnderlinedIconButton({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final Function() onPressed;

  @override
  State<AnimatedUnderlinedIconButton> createState() => _AnimatedUnderlinedIconButtonState();
}

class _AnimatedUnderlinedIconButtonState extends State<AnimatedUnderlinedIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            widget.onPressed();
          },
          child: Column(
            children: [
              Icon(
                widget.icon.icon,
                color: Colors.white,
                size: 35,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: 2,
                width: _isHovered ? 39 : 0,
                color: Colors.red,
                margin: const EdgeInsets.only(top: 4),
              ),
            ],
          ),
        ),
    );
  }
}