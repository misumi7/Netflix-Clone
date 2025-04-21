import 'package:flutter/material.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({ super.key });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          width: 65,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                UnderlinedIconButton(
                  icon: const Icon(Icons.home),
                ),
                const SizedBox(height: 20),
                UnderlinedIconButton(
                  icon: const Icon(Icons.movie),
                ),
                const SizedBox(height: 20),
                UnderlinedIconButton(
                  icon: const Icon(Icons.tv),
                ),
                const SizedBox(height: 20),
                UnderlinedIconButton(
                  icon: const Icon(Icons.plus_one_sharp),
                ),
              ],
          ),
      ),
    );
  }
}

class UnderlinedIconButton extends StatefulWidget{
  const UnderlinedIconButton({super.key, required this.icon});
  final Icon icon;

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
            print("Icon tapped");
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