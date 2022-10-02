import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class UnitButton extends StatefulWidget {
  final String text;
  final VoidCallback onPress;
  final bool disabled;
  final bool highlighted;
  final bool primary;
  final double maxWidth;
  final double maxHeight;
  final double fontSize;

  UnitButton(
      {Key key,
      @required this.text,
      this.onPress,
      this.disabled = false,
      this.highlighted = false,
      this.primary = true,
      this.maxHeight,
      this.maxWidth,
      this.fontSize})
      : super(key: key);

  @override
  _UnitButtonState createState() {
    return   _UnitButtonState();
  }
}

class _UnitButtonState extends State<UnitButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(UnitButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      print("Hello World!!");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
        constraints: BoxConstraints.tightFor(
            height: widget.maxHeight, width: widget.maxWidth),
        child: ElevatedButton(
          style: ButtonStyle(   backgroundColor:  MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
      return  widget.highlighted
                ? Theme.of(context).primaryColor
                : Color.fromARGB(255, 103, 182, 247);
                
                }),
            // splashColor: Theme.of(context).accentColor,
            // highlightColor: Theme.of(context).accentColor,
            // disabledColor: Color(0xFFDDDDDD),
            
            //  padding: EdgeInsets.all(0.0),
            // shape: 
            // RoundedRectangleBorder(
            //     side: 
            // BorderSide(
            //         color: widget.disabled
            //             ? Color(0xFFDDDDDD)
            //             : widget.primary
            //                 ? Theme.of(context).primaryColor
            //                 : Colors.white,
            //         width: 4.0),
            //     borderRadius: BorderRadius.all(Radius.circular(8.0))),
            
            ),
           
            onPressed: widget.disabled
                ? null
                : () {
                    widget.onPress();
                  },
           
            child: _buildUnit(widget.fontSize)));
  }

  Widget _buildUnit(double fontSize) {
    return Center(
        child: Text(widget.text,
            style:   TextStyle(
                // color: widget.highlighted || !widget.white
                //     ? Colors.white
                 //   : Theme.of(context).primaryColor,
                 color: Colors.black,
                fontSize: fontSize)));
  }

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }
}
