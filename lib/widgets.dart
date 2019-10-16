import 'package:flutter/material.dart';
import 'package:json_app/utils.dart';

class SimpleObjectView extends StatelessWidget {
  final dynamic simpleObject;

  SimpleObjectView(dynamic obj) : simpleObject = obj;

  @override
  Widget build(BuildContext context) {
    final localTheme = Theme.of(context).textTheme;
    final bodyStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    if(simpleObject == null){
      return Text('NULL',
      style: localTheme.body1);
    }

    return Table(
         columnWidths: const{
           0 : IntrinsicColumnWidth(),
           1 : FlexColumnWidth(1.0)
         },
      children: [
        TableRow(
          children: [
            Text(
              'aString',
              style: bodyStyle,
            ),
            Text(
              simpleObject.aString != null
                  ? '"$simpleObject.aString"'
                  : 'NULL',
              style: localTheme.body1,
            )
          ]
        ),
        TableRow(
            children: [
              Text(
                'anInt',
                style: bodyStyle,
              ),
              Text(
                simpleObject.anInt ?.toString() ?? 'NUll',
                style: localTheme.body1,
              )
            ]
        ),
        TableRow(
          children: [
            Text(
              'aDouble',
              style: bodyStyle,
            ),
            Text(
              simpleObject.aDouble ?.toString() ?? 'NULL',
              style: localTheme.body1,
            )
          ]
        ),
        TableRow(
          children: [
            Text(
              'aListOfStrings',
              style: bodyStyle,
            ),
            Text(
              prettyPrintList(simpleObject.aListOfStrings as Iterable<dynamic>),
              style: localTheme.body1,
            ),
          ]
        ),
        TableRow(
          children: [
            Text('aListOfInts:',
                style: bodyStyle),
            Text(
              prettyPrintList(simpleObject.aListOfInts as Iterable<dynamic>),
              style: localTheme.body1,
            ),
          ]
        ),
        TableRow(
          children: [
            Padding(
              padding:const EdgeInsets.only(right: 8.0),
              child: Text(
                'aListOfDoubles',
                style: bodyStyle,
              ),
            ),
            Text(
              prettyPrintList(simpleObject.aListOfDoubles as Iterable<dynamic>),
              style: localTheme.body1,
            )
          ]
        )
      ],
    );
  }
}

class SimpleIbjViewList extends StatelessWidget{
  final List<dynamic> simpleObjects ;

  SimpleIbjViewList(List<dynamic> object) :simpleObjects = object;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];

    for(int i=0; i< simpleObjects.length; i++){
      widgets.addAll([
          Text(
            'Simple Object $i: ',
            style: Theme.of(context).textTheme.subhead,
          ),
          const SizedBox(height: 4.0,),
        SimpleObjectView(simpleObjects[i]),
        const SizedBox(height: 24,)
        ]
      );
    }

    widgets.removeLast();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}



