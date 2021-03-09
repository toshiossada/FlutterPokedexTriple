import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokeballWidget extends StatelessWidget {
  final double size;

  const PokeballWidget({Key? key, this.size = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.string(
            '''<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="95.9" height="93" viewBox="0 0 95.9 93">
              <defs>
                <linearGradient id="linear-gradient" x1="0.5" x2="0.5" y2="1" gradientUnits="objectBoundingBox">
                  <stop offset="0" stop-color="#fafafa" stop-opacity="0.8"/>
                  <stop offset="1" stop-color="#7d7d7d" stop-opacity="0.8"/>
                </linearGradient>
              </defs>
              <path id="Union_1" data-name="Union 1" d="M185.5,426a46.494,46.494,0,0,1-45.75-38.132h28.993a20.8,20.8,0,0,0,37.874,0h28.632a46.109,46.109,0,0,1-5.6,15.108A46.429,46.429,0,0,1,189.5,426Zm-12.279-46.44a14.52,14.52,0,1,1,14.52,14.4A14.463,14.463,0,0,1,173.221,379.56Zm-4.971-7.232h-28.7A46.456,46.456,0,0,1,185.5,333h4a46.51,46.51,0,0,1,45.949,39.326H207.11a20.793,20.793,0,0,0-38.858,0h0Z" transform="translate(-139.549 -333)" fill="url(#linear-gradient)"/>
            </svg>'''));
  }
}
