import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';
import 'weathercard.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Background createState() => _Background();
}

class _Background extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: backgroundAnimation(icon))
      ],
    );
  }
}

backgroundAnimation(String? icon) {
  switch (icon!.toLowerCase()) {
    case "01d":
      return const WrapperScene(
        colors: [Colors.blue, Colors.lightBlue],
        children: [SunWidget()],
      );

    case "01n":
      return const WrapperScene(colors: [
        Color(0xff263238),
        Color(0xff37474f)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            width: 250,
            blurSigma: 26,
            coreColor: Color(0xffbdbdbd),
            midColor: Color(0x18fafafa),
            outColor: Color(0x00757575),
          ),
        )
      ]);

    case "02d":
      return const WrapperScene(colors: [
        Color(0xff303f9f),
        Color(0xff1e88e5),
        Color(0xffbdbdbd)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            coreColor: Color(0xffffb74d),
            midColor: Color(0xffffff8d),
            outColor: Color(0xffffd180),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            x: 140,
            y: 97,
            color: Color(0xa8fafafa),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xa8fafafa),
            x: 20,
            y: 3,
          ),
        )
      ]);

    case "02n":
      return const WrapperScene(colors: [
        Color(0xff263238),
        Color(0xff37474f)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            width: 250,
            blurSigma: 26,
            coreColor: Color(0xffbdbdbd),
            midColor: Color(0x18fafafa),
            outColor: Color(0x00757575),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0x879e9e9e),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0x65d6d6d6),
            x: 140,
            y: 130,
            scaleBegin: 1,
            scaleEnd: 1.1,
            slideX: 20,
            slideY: 4,
          ),
        )
      ]);

    case "03d":
      return const WrapperScene(colors: [
        Color(0xff3d5afe),
        Color(0xff2196f3)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
              width: 300,
              midColor: Color(0x00000000),
              outColor: Color(0x00000000),
              coreColor: Color(0xffffb74d)),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 269,
            color: Color(0xbfeeeeee),
            x: 22,
            y: 3,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
      ]);

    case "03n":
      return const WrapperScene(colors: [
        Color(0xff263238),
        Color(0xff37474f)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            width: 300,
            coreColor: Color(0xffbdbdbd),
            midColor: Color(0x00ffee58),
            outColor: Color(0x02ffa726),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 269,
            color: Color(0xbfeeeeee),
            x: 22,
            y: 3,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
      ]);

    case "04d":
      return const WrapperScene(colors: [
        Color(0xff3d5afe),
        Color(0xff2196f3)
      ], children: [
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xbfeeeeee),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0x8be0e0e0),
            x: 140,
            y: 130,
            scaleBegin: 1,
            scaleEnd: 1.1,
            slideX: 20,
            slideY: 4,
          ),
        ),
      ]);

    case "04n":
      return const WrapperScene(colors: [
        Color(0xff263238),
        Color(0xff78909c)
      ], children: [
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xad90a4ae),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0xb1607d8b),
            x: 140,
            y: 130,
            scaleBegin: 1,
            scaleEnd: 1.1,
            slideX: 20,
            slideY: 4,
          ),
        ),
      ]);

    case "09d" || "09n":
      return WeatherScene.rainyOvercast.sceneWidget;

    case "10d":
      return const WrapperScene(colors: [
        Color(0xff616161),
        Color(0xffbdbdbd)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            width: 278,
            blurSigma: 26,
            coreColor: Color(0xffffcc80),
            midColor: Color(0x38fff176),
            outColor: Color(0x00000000),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xea424242),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0xe1303030),
            x: 140,
            y: 130,
            scaleBegin: 1,
            scaleEnd: 1.1,
            slideX: 20,
            slideY: 4,
          ),
        ),
        RainWidget(
          rainConfig: RainConfig(
            count: 10,
            lengthDrop: 8,
            widthDrop: 4,
            color: Color(0xdb455a64),
            fallRangeMinDurMill: 500,
            fallRangeMaxDurMill: 1500,
            areaXStart: 84,
            areaXEnd: 191,
            areaYStart: 215,
            areaYEnd: 540,
            slideX: 2,
            slideY: 0,
          ),
        ),
        RainWidget(
          rainConfig: RainConfig(
            count: 10,
            lengthDrop: 13,
            widthDrop: 5,
            color: Color(0xdb455a64),
            areaXStart: 51,
            areaXEnd: 199,
            areaYStart: 199,
            slideX: 2,
            slideY: 0,
          ),
        )
      ]);

    case "10n":
      return const WrapperScene(colors: [
        Color(0xff263238),
        Color(0xff37474f)
      ], children: [
        SunWidget(
          sunConfig: SunConfig(
            width: 250,
            blurSigma: 26,
            coreColor: Color(0xffbdbdbd),
            midColor: Color(0x18fafafa),
            outColor: Color(0x00757575),
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xcc616161),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0xff616161),
            x: 140,
            y: 130,
            scaleBegin: 1,
            scaleEnd: 1.1,
            slideX: 20,
            slideY: 4,
          ),
        ),
        RainWidget(
          rainConfig: RainConfig(
            count: 10,
            lengthDrop: 8,
            widthDrop: 4,
            color: Color(0xff78909c),
            fallRangeMinDurMill: 500,
            fallRangeMaxDurMill: 1500,
            areaXStart: 84,
            areaXEnd: 191,
            areaYStart: 215,
            areaYEnd: 540,
            slideX: 2,
            slideY: 0,
          ),
        ),
        RainWidget(
          rainConfig: RainConfig(
            count: 10,
            lengthDrop: 13,
            widthDrop: 5,
            color: Color(0x9978909c),
            areaXStart: 51,
            areaXEnd: 199,
            areaYStart: 199,
            slideX: 2,
            slideY: 0,
          ),
        )
      ]);

    case "11d" || "11n":
      return WeatherScene.stormy.sceneWidget;

    case "13d" || "13n":
      return WeatherScene.showerSleet.sceneWidget;

    case "50d" || "50n":
      return const WrapperScene(colors: [
        Color(0xff616161),
        Color(0xffbdbdbd)
      ], children: [
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xffbdbdbd),
            x: 20,
            y: 35,
            scaleBegin: 1,
            scaleEnd: 1.08,
            slideX: 20,
            slideY: 0,
          ),
        ),
        WindWidget()
      ]);

    case "initial":
      return const WrapperScene(colors: [
        Color(0xff424242),
        Color(0xff48484A)
      ], children: [
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 250,
            color: Color(0xad90a4ae),
            x: 30,
            y: 100,
            slideX: 20,
            slideY: 0,
          ),
        ),
        CloudWidget(
          cloudConfig: CloudConfig(
            size: 160,
            color: Color(0xb1607d8b),
            x: 160,
            y: 200,
            slideY: 4,
          ),
        ),
        WindWidget(
          windConfig: WindConfig(y: 400),
        )
      ]);

    default:
      return WeatherScene.weatherEvery.sceneWidget;
  }
}
