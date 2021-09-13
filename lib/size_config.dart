import 'package:flutter/cupertino.dart';

class sizeconfig{
  static double baseHeight = 509.33333333333337;
  static double baseWidth = 320.0;
  static double heightScaleRatio;
  static double widthScaleRatio;
  static double scaleFactor;

  static MediaQueryData _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blocksizeHorizontal;
  static double blocksizeVertical;

  static double safeAreaHorizontal;
  static double safeAreaVertical;
  static double safeBlockHorizontal = 1;
  static double safeBlockVertical = 1;

  void calculateScaleRatio() {
    heightScaleRatio = screenHeight / baseHeight;
    widthScaleRatio = screenHeight/ baseWidth;
  }

  double scaleHeight(double actualHeight){
    return actualHeight * heightScaleRatio * scaleFactor;
  }

  double scaleWidth ( double actualWidth ) {
    return actualWidth * widthScaleRatio *scaleFactor;
  }





  void init(BuildContext context){
    /**
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blocksizeHorizontal = screenHeight/100;
    blocksizeVertical =screenWidth/100;

    safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - safeAreaVertical)/100;

    var heightp = screenHeight-safeAreaVertical;
    var widthp = screenWidth- safeAreaVertical;

    print('$heightp');
    print("$widthp");

    **/
    if ((sizeconfig.screenHeight == 0) && (sizeconfig.screenWidth == 0)){
      Size screenSize  = MediaQuery.of(context).size;
      sizeconfig.screenHeight = screenSize.height-MediaQuery.of(context).padding.top -MediaQuery.of(context).padding.bottom;
      sizeconfig.screenWidth = screenSize.width-MediaQuery.of(context).padding.right -MediaQuery.of(context).padding.left;
      sizeconfig().calculateScaleRatio();
    }
    sizeconfig.scaleFactor = MediaQuery.of(context).textScaleFactor;
    print(screenHeight);
    print(screenWidth);
  }

}