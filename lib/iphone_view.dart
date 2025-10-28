import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class DragLiquidGlass extends StatefulWidget {
  @override
  State<DragLiquidGlass> createState() => _DragLiquidGlassState();
}

class _DragLiquidGlassState extends State<DragLiquidGlass> {
  Offset position = const Offset(50, 550);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('lib/assets/download.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanUpdate: (details) {
                setState(() {
                  position += details.delta;
                });
              },
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(
                  borderRadius: Radius.circular(25),
                ),
                settings: const LiquidGlassSettings(
                  thickness: 30,
                  blur: 0,
                  lightAngle: 0.0,
                  blend: 0,
                  glassColor: Color.fromARGB(30, 145, 125, 125),
                ),
                child: SizedBox(width: 250, height: 200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
