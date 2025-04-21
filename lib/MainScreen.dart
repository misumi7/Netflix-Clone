import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Banner(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget{
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            'assets/images/home_screen/1.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),

          // Shadows
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 80,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
          ),

          // Title and Description
          // Tried to use a Row but a pixel line is dividing 2 containers
          // Try to fix later
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.29 - 1,
            top: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.05, 1.0],
                  colors: [Colors.black, Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),

          // Buttons
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverButton(
                  color: const Color.fromRGBO(169, 13, 13, 1.0),
                  textColor: Colors.white,
                  text: "Play",
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                HoverButton(
                  color: const Color.fromRGBO(227, 227, 227, 1.0),
                  textColor: Colors.black,
                  text: "Watch Trailer",
                ),
              ],
            ),
          )
        ]
    );
  }
}

class HoverButton extends StatefulWidget{
  const HoverButton({super.key, required this.color, required this.textColor, required this.text});
  final String text;
  final Color color;
  final Color textColor;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () {
              print("Button tapped");
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.fromLTRB(45, 12, 45, 12),
              decoration: BoxDecoration(
                color: _isHovered ? widget.color.withOpacity(0.85) : widget.color,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
    );
  }
}