import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({super.key, required this.onPageSelected});

  final Function(int) onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width * 0.07,
          color: Colors.black,
          child: Column(
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
                    UnderlinedIconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        onPageSelected(1);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UnderlinedIconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {
                        onPageSelected(0);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UnderlinedIconButton(
                      icon: const Icon(Icons.movie),
                      onPressed: () {
                        onPageSelected(2);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UnderlinedIconButton(
                      icon: const Icon(Icons.live_tv),
                      onPressed: () {
                        onPageSelected(3);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UnderlinedIconButton(
                      icon: const Icon(Icons.bookmark_added),
                      onPressed: () {
                        onPageSelected(4);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    UnderlinedIconButton(
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

class UnderlinedIconButton extends StatefulWidget{
  const UnderlinedIconButton({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final Function() onPressed;

  @override
  State<UnderlinedIconButton> createState() => _UnderlinedIconButtonState();
}

class _UnderlinedIconButtonState extends State<UnderlinedIconButton> {
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