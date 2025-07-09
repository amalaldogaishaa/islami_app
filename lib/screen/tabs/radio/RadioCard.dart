import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:islami_app/them/app_theme.dart';

class RadioCard extends StatefulWidget {
  final String title;
  final bool isPlaying;

  const RadioCard({super.key, required this.title, this.isPlaying = false});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard>
    with SingleTickerProviderStateMixin {
  late bool _currentIsPlaying;
  late AnimationController _waveformController;
  final int _numberOfBars = 20;

  @override
  void initState() {
    super.initState();
    _currentIsPlaying = widget.isPlaying;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: AppTheme.black.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            _currentIsPlaying
                ? Positioned.fill(
                    child: Transform.translate(
                      offset: Offset(0, 60),
                      child: Image.asset(
                        'assets/images/backgroundplayer.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  )
                : Positioned.fill(
                    child: Image.asset(
                      'assets/images/backgroundradio.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppTheme.black,
                    fontFamily: 'Janna',
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        _currentIsPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_arrow,
                        color: AppTheme.black,
                        size: 42,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIsPlaying = !_currentIsPlaying;
                          if (_currentIsPlaying) {
                            _waveformController.repeat(reverse: true);
                          } else {
                            _waveformController.stop();
                            _waveformController.reset();
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _currentIsPlaying ? Icons.volume_off : Icons.volume_up,
                        color: AppTheme.black,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
