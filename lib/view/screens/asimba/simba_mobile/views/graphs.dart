import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simbadesketop/data/data.dart';
import 'package:simbadesketop/util/dimensions.dart';
import 'package:simbadesketop/util/styles.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/dashboard/graphs1.dart';
import 'package:simbadesketop/view/screens/asimba/desktop/dashboard/notifications.dart';

// import '../data.dart';

final _monthDayFormat = DateFormat('MM-dd');

class LineAreaPointMobilePage extends StatelessWidget {
  LineAreaPointMobilePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
                20.height,
                  Padding(
                                                  
                  padding: const EdgeInsets.all(20.0),
                   child: Column(
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  
                                                                // row
                                                                Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    
                            
                                                                    Container(
                                                                      // color: greenYellow,
                                                                      height: 540,
                                                                      width:325,
                                                                      decoration: BoxDecoration(
                                                                        color:  const Color.fromARGB(243, 159, 212, 65),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12), // Rounded corners
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(10.0),
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      
                                                                          children: [
                                                                      
                                                                             Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                             children: [
                                                                              

                                                                                Text("Check full reports",
                                                                                   textAlign: TextAlign.center, maxLines: 2,style: rubikRegular.copyWith(
                                                                                        fontSize: 15,
                                                                                        color: Color.fromARGB(255, 18, 101, 72),
                                                                                  ),                                                                   
                                                                                  ),
                                                                               TextButton(
                                                                                 onPressed: () {  },
                                                                                 child: Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 18, 101, 72),
                                                                                      size: 20,),
                                                                               )
                                                                                    ],
                                                                                  ),
                                                                           10.height,
                                                                      
                                                                      
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("2,567",
                                                                                   textAlign: TextAlign.center, maxLines: 2,
                                                                                      style: rubikRegular.copyWith(
                                                                                        fontSize: 60,
                                                                                        letterSpacing: 3,
                                                                                        color: const Color.fromARGB(255, 18, 101, 72),
                                                                                  ),

                                                                                                                                                         
                                                                                  ),
                                                                                  10.height,
// pcorrection
                                                                                  Row(
                                                                                   children: [
                                                                                     Container(
                                                                                       width: 40,
                                                                                      height: 40,
                                                                                      decoration: BoxDecoration(shape: BoxShape.circle,),
                                                                                      child: Icon(Icons.arrow_upward, color: const Color.fromARGB(255, 18, 101, 72), size: 20,)),
                                                                                     5.width,
                                                                                     Text("+23 %  conversion rate",
                                                                                      textAlign: TextAlign.center, maxLines: 2,
                                                                                      style: rubikRegular.copyWith(
                                                                                        fontSize: 15,
                                                                                        color: const Color.fromARGB(255, 18, 101, 72),
                                                                                  ))
                                                                                   ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                      
                                                                            Container(
                                                                                  margin: const EdgeInsets.only(top: 10),
                                                                                  width: 250,
                                                                                  height: 200,
                                                                                  child: Chart(
                                                                                    data: invalidData,
                                                                                    variables: {
                                                                                      'Date': Variable(
                                                                                        accessor: (Map map) => map['Date'] as String,
                                                                                        scale: OrdinalScale(tickCount: 5),
                                                                                      ),
                                                                                      'Close': Variable(
                                                                                        accessor: (Map map) =>
                                                                                            (map['Close'] ?? double.nan) as num,
                                                                                      ),
                                                                                    },
                                                                                    marks: [
                                                                                      AreaMark(
                                                                                        shape: ShapeEncode(value: BasicAreaShape(smooth: true)),
                                                                                        color: ColorEncode(
                                                                                            value: Defaults.colors10.first.withAlpha(80)),
                                                                                      ),
                                                                                      LineMark(
                                                                                        shape: ShapeEncode(value: BasicLineShape(smooth: true)),
                                                                                        size: SizeEncode(value: 0.5),
                                                                                      ),
                                                                                    ],
                                                                                    axes: [
                                                                                      Defaults.horizontalAxis,
                                                                                      Defaults.verticalAxis,
                                                                                    ],
                                                                                    selections: {
                                                                                      'touchMove': PointSelection(
                                                                                        on: {
                                                                                          GestureType.scaleUpdate,
                                                                                          GestureType.tapDown,
                                                                                          GestureType.longPressMoveUpdate
                                                                                        },
                                                                                        dim: Dim.x,
                                                                                      )
                                                                                    },
                                                                                    tooltip: TooltipGuide(
                                                                                      followPointer: [false, true],
                                                                                      align: Alignment.topLeft,
                                                                                      offset: const Offset(-20, -20),
                                                                                    ),
                                                                                    crosshair: CrosshairGuide(followPointer: [false, true]),
                                                                                  ),
                                                                                ),
                                                                                
                                                                                                                                      
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                  
                            
                                                                // left column
                                                                Column(
                                                                      children:[
                                                                      Container(
                                                                        height: 260,
                                                                        width:500,
                                                                        decoration: BoxDecoration(
                                                                        color:  lightPink,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10), // Rounded corners
                                                                      ), 
                                                                      child: InteractionStreamDynamicPage()
                                                                        
                                                                        // child: Text("data"),
                                                                      ),
                                                                      20.height,
                                                                      Container(
                                                                        height: 260,
                                                                        width:500,
                                                                        decoration: BoxDecoration(
                                                                        color:  white,
                                                                        border: Border.all(
                                                                                color: const Color.fromARGB(255, 127, 127, 127), // Set the border color
                                                                                width: 2.0, // Set the border width
                                                                              ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10), // Rounded corners
                                                                      ),
                                                                        
                                                                        child: DashboardNotification(),
                                                                      ),
                                                            
                                                                      
                                                            
                                                                      
                                                                      ],
                                                                      
                                                            
                                                                    ),
                                                                // column
                                                              ],),
                                                          ],
                                                        ),
                                                        ),
               ],
          ),
        ),
      );
  }
}
