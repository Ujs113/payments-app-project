import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/pages/payment_page.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:flutter_payment_app/widgets/large_buttons.dart';
import 'package:flutter_payment_app/widgets/text_size.dart';
import 'package:flutter_payment_app/pages/history.dart';
import 'package:get/get.dart';

class Bills extends StatefulWidget {
  const Bills({Key? key}) : super(key: key);

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Positioned(
              top: 40,
              left: 30,
              child: AppButtons(
                icon: Icons.arrow_circle_left,
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                onTap: (){
                  Get.back();
                },
              ),
            ),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _addBill(){
    return Positioned(
      child: Container(
        width: 600,
        height: 250,
        decoration: BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.circular(30)
        ),
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }


  _headSection(){
    return Container(
      // color: Colors.red;
      height:280,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }
  _mainBackground(){
    return Positioned(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                      "images/background.png"
                  )
              )
          ),
        )
    );
  }
  _curveImageContainer(){
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
            height: MediaQuery.of(context).size.height*0.15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        "images/curve.png"
                    )
                )
            )
        )
    );
  }
  _buttonContainer(){
    return Positioned(
        right: 44,
        bottom: 15,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc){
                  return Container(
                    height: MediaQuery.of(context).size.height-200,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.8),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height-265,
                            )),
                        Positioned(
                            top:5,
                            right: 44,
                            child: Container(
                              padding: const EdgeInsets.only(top:1, bottom: 25),
                              margin: const EdgeInsets.only(top:10),
                              width: 60,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                    icon: Icons.add,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: (){
                                      Navigator.pop(context);
                                      _addBill();
                                    },
                                    text: "Add Bill",
                                  ),
                                  AppButtons(
                                      icon: Icons.history,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: (){
                                        Get.to(()=>History());
                                      },
                                      text: "History"
                                  ),
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  );
                }
            );
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "images/lines.png"
                    )
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(0,1),
                    color: Color(0xFF11324d).withOpacity(0.2),
                  )
                ]
            ),
          ),
        )
    );
  }
  _textContainer(){
    return Stack(
      children: [
        // Positioned(
        //   left: 0,
        //   top: 100,
        //   child: Text(
        //     "My Bills",
        //     style: TextStyle(
        //         fontSize: 70,
        //         fontWeight: FontWeight.bold,
        //         color: Color(0xff293952)
        //     ),
        //   )
        // ),
        Positioned(
            left: 40,
            top: 100,
            child: Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
        ),
      ],
    );
  }

  _listBills(){
    return Positioned(
        top: 265,
        left: 0,
        right: 0,
        bottom: 90,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(top: 20,right:5),
                height: 130,
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1,1),
                          blurRadius: 20.0,
                          spreadRadius: 10
                      )
                    ]
                ),
                child: Container(
                  margin: const EdgeInsets.only(top:10,left:18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.grey,
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            "images/brand1.png"
                                        )
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KenGen Power",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "ID: 846584",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.idColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedText(text:"Auto pay on 24th May 18", color: AppColor.green),
                          SizedBox(height: 10,)
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground
                                ),
                                child: Center(
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.selectColor
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\$1224.00",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.mainColor
                                ),
                              ),
                              Text(
                                "Due in 3 days",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.idColor
                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 5,
                        height: 35,
                        decoration: BoxDecoration(
                            color: AppColor.halfOval,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
  _payButton(){
    return Positioned(
      bottom: 15,
      child: AppLargeButton(text: "Pay all bills",textColor: Colors.white, onTap: (){Get.to(()=>PaymentPage());},),
    );
  }
}