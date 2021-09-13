// import 'package:calculator_app_update/adstate.dart';
import 'package:calculator_app_update/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:admob_inline_ads_in_flutter/ad_helper.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';
//import 'dart:html';

void main() {

 WidgetsFlutterBinding.ensureInitialized();
  // final initFuture = MobileAds.instance.initiali ze();
  // final adState = Adstate(initFuture);
  //MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((value) => runApp(MaterialApp(home: Home())));

}
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // BannerAd banner;
  // BannerAd banner_2;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<Adstate>(context);
  //   adState.initialization.then((value) => setState(
  //       (){
  //         banner = BannerAd(
  //           adUnitId: adState.bannerAdUnitId,
  //           size: AdSize.banner,
  //           request: AdRequest(),
  //           listener: adState.adListener
  //         )..load();
  //         //banner_2 = BannerAd(
  //             //adUnitId: adState.bannerAdUnitId_2,
  //             //size: AdSize.banner,
  //             //request: AdRequest(),
  //             //listener: adState.adListener
  //         //)..load();
  //       }
  //   ));
  // }

  String value1 = '';
  String value2 = '';
  String value =  '';
  String operation = '';
  int valuelenght;
  final answer = TextEditingController();
  ScrollController _scrollController = ScrollController();
  void result(String va12, String val2, String val, int valLenght ){
    //gets second value
    value2 = value.substring(valuelenght,value.length);
    //print(value2);
    //print(value1);
    // works on it
    check(value1,value2,operation);

    //assign value == answer.txt
    value = answer.text;
    value1='';
    value2='';
  }

  void button(String number){

    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
    answer.text = answer.text + number;
    value = value + number;
    //print(value);
    answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
  }

  void check(String v1,String v2,String op){
    if (op == '+'){
      add(v1,v2) ;
    }
    else if (op == '-'){
      subtract(v1,v2);
    }
    else if (op == '/'){
      divide(v1,v2);
    }
    else if (op == 'x'){
      multiply(v1,v2);
    }


  }
  void add(String v1,String v2){
    dynamic ans = double.parse(v1) + double.parse(v2);

    // tries to round up numbers
    if (ans.toString().length >16){
      ans = ans.toStringAsExponential(4);
      answer.text = ans.toString();
    }
    answer.text = ans.toString();
  }
  void subtract(String v1,String v2){
    dynamic ans = double.parse(v1) - double.parse(v2);
    if (ans.toString().length >16){
      ans = ans.toStringAsExponential(4);
      answer.text = ans.toString();
    }
    answer.text = ans.toString();
  }
  void divide(String v1,String v2){
    dynamic ans = double.parse(v1) / double.parse(v2);
    if (ans.toString().length >16){
      ans = ans.toStringAsExponential(4);
      answer.text = ans.toString();
    }
    answer.text = ans.toString();
  }
  void multiply(String v1,String v2){
    dynamic ans = double.parse(v1) * double.parse(v2);
    if (ans.toString().length >16){
      ans = ans.toStringAsExponential(4);
      answer.text = ans.toString();
    }
    answer.text = ans.toString();
  }
  void percentage(String v){
    dynamic ans = double.parse(v);
    answer.text = ans/100.toString();
    value = answer.text;

  }


  @override
  Widget build(BuildContext context) {
    sizeconfig().init(context);
    final Height = MediaQuery.of(context).size.height-
        MediaQuery.of(context).padding.top-kToolbarHeight;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Divider(thickness: 1,height: 1,color: Colors.blueAccent,),
            Container(
              //constraints: BoxConstraints(maxHeight: 500, maxWidth: 100),
              margin: EdgeInsets.all(20),
              color: Colors.black,
              height: sizeconfig().scaleHeight(100),
              child:SingleChildScrollView(
                controller: _scrollController,
                reverse: false,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(width: Width*200000,),

                  child: TextFormField(
                    controller: answer,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: sizeconfig().scaleWidth(20),
                        fontFamily: "Balsamiq"
                    ),
                    expands: true,
                    //maxLength: null,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.multiline,
                    //textDirection: TextDirection.rtl,
                    showCursor: false,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1,height: 1,color: Colors.blueAccent,),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed:(){answer.text = '';
                            value = '';},
                            child: Text("C",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: "Balsamiq",
                                    fontWeight: FontWeight.normal,
                                    fontSize: sizeconfig().scaleWidth(15)

                                )

                            )),
                        TextButton(
                            onPressed:(){
                              try {
                                // try and get result if it doesnt work run catch
                                //tries to add two values available if any
                                result(value1, value2, value, valuelenght);
                                answer.text = answer.text + "/";
                                value = value + '/';
                                operation = '/';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }
                              catch(e){
                                // for normal addition
                                answer.text = answer.text + "/";
                                value = value + '/';
                                operation = "/";
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }

                            },
                            child: Text("/",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontFamily: "Balsamiq",
                                  fontWeight: FontWeight.normal,
                                  fontSize: sizeconfig().scaleWidth(15)
                              ),)),
                        TextButton(
                            onPressed:(){
                              try {
                                // try and get result if it doesnt work run catch
                                //tries to add two values available if any
                                result(value1, value2, value, valuelenght);
                                answer.text = answer.text + "x";
                                value = value + 'x';
                                operation = 'x';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }
                              catch(e){
                                // for normal addition
                                answer.text = answer.text + "x";
                                value = value + 'x';
                                operation = 'x';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }},
                            child: Text("x",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontFamily: "Balsamiq",
                                  fontWeight: FontWeight.normal,
                                  fontSize: sizeconfig().scaleWidth(15)
                              ),)),
                        IconButton(
                          icon: Icon(FlutterIcons.back_ant,
                            color: Colors.blueAccent,),
                          onPressed:(){
                            //replace last value with nothing
                            value = value.replaceRange(value.length-1, value.length, '');
                            print(value);
                            int len = answer.text.length;
                            //replaces last value of answer.txt with nothing
                            answer.text = answer.text.replaceRange(len-1, len, '');

                            answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                          },),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed:(){button('7');},
                            child: Button_text_white(text: "7",)
                        ),
                        TextButton(
                            onPressed:(){button('8');},
                            child: Button_text_white(text: "8",)
                        ),
                        TextButton(
                            onPressed:(){button('9');},
                            child: Button_text_white(text: "9",)
                        ),
                        TextButton(
                            onPressed:(){
                              try {
                                // try and get result if it doesnt work run catch
                                //tries to add two values available if any
                                result(value1, value2, value, valuelenght);
                                answer.text = answer.text + "-";
                                value = value + '-';
                                operation = '-';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }
                              catch(e){
                                // for normal addition
                                answer.text = answer.text + "-";
                                value = value + '-';
                                operation = '-';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }},
                            child: Button_text_blue(text: "-",)
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed:(){ button('4');},
                            child: Button_text_white(text: "4",)
                        ),
                        TextButton(
                            onPressed:(){button('5');},
                            child: Button_text_white(text: "5",)
                        ),
                        TextButton(
                            onPressed:(){button('6');},
                            child: Button_text_white(text: "6", )
                        ),
                        TextButton(
                            onPressed:(){
                              try {
                                // try and get result if it doesnt work run catch
                                //tries to add two values available if any
                                result(value1, value2, value, valuelenght);
                                answer.text = answer.text + "+";
                                value = value + '+';
                                operation = '+';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }
                              catch(e){
                                // for normal addition
                                answer.text = answer.text + "+";
                                value = value + '+';
                                operation = '+';
                                value1 = value.substring(0,value.length-1) ;

                                valuelenght = value.length;
                                answer.selection = TextSelection.fromPosition(TextPosition(offset: answer.text.length));
                              }
                            },
                            child: Button_text_blue(text: "+",)
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed:(){button('1');},
                            child: Button_text_white(text: "1",)
                        ),
                        TextButton(
                            onPressed:(){button('2');},
                            child: Button_text_white(text: "2",)
                        ),
                        TextButton(
                            onPressed:(){button('3');},
                            child: Button_text_white(text: "3",)
                        ),
                        TextButton(
                            onPressed:(){ _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
                            button('-');},
                            child: Button_text_blue(text:"-/+",)
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed:(){
                              try{
                                String values = value;
                                double valueInt = double.parse(values);
                                double percent = valueInt/100;
                                if (percent.toString().length > 6 ){
                                  value = percent.toStringAsExponential(4);
                                  answer.text = value;
                                }
                                else{
                                  value = percent.toString();
                                  answer.text = value;
                                }
                              }

                              catch(e) {}
                            },
                            child: Button_text_white(text: "%", )
                        ),
                        TextButton(
                            onPressed:(){button('0');
                            },
                            child: Button_text_white(text: "0",)
                        ),
                        TextButton(
                            onPressed:(){button('.');
                            },
                            child: Button_text_white(text: ".",)
                        ),

                        // Container(
                        //   padding: EdgeInsets.fromLTRB(sizeconfig().scaleWidth(3), sizeconfig().scaleHeight(2), sizeconfig().scaleWidth(3), sizeconfig().scaleHeight(2)),
                        //   decoration: BoxDecoration(
                        //       color: Colors.blueAccent,
                        //       borderRadius: BorderRadius.circular(sizeconfig().scaleWidth(5))
                        //   ),
                        //   child: TextButton(
                        //       onPressed:(){

                        //         result(value1, value2, value, valuelenght);


                        //       },
                        //       child: Button_text_white(text: "=")),
                        // ),
                      ],
                    // ),
                    // if (banner == null )
                    //   SizedBox(height: sizeconfig().scaleHeight(50),)
                    // else
                    //   Container(
                    //     height: sizeconfig().scaleHeight(60),
                    //     child: AdWidget(ad: banner,),
                      )
                  ],
                ),
                //height: Height*0.77,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class Button_text_white extends StatelessWidget {
  Button_text_white({this.text});
  String text;


  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontFamily: "Balsamiq",
          fontSize: sizeconfig().scaleWidth(15)
      ),);
  }
}
// ignore: must_be_immutable, camel_case_types
class Button_text_blue extends StatelessWidget {
  Button_text_blue({this.text});
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.normal,
          fontFamily: "Balsamiq",
          fontSize: sizeconfig().scaleWidth(15)
      ),);
  }
}
