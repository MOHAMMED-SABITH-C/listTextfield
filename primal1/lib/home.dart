import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:primal1/objects.dart';
import 'package:primal1/providers.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height;
  late double width;
  // late double total=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
    return Consumer<Change>(builder: (context, edit, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(246, 235, 233, 233),
          appBar: AppBar(
            title: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: const Color.fromARGB(255, 15, 88, 147)),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              // Positioned(child: SizedBox(height: 10,)),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: height != 0
                      ? height - 60
                      : 0, // MediaQuery.of(context).size.height-50,
                  width: width, //MediaQuery.of(context).size.width,
                  // child: ValueListenableBuilder(builder: (BuildContext context,List ),),
                  child: ListView.builder(
                      itemCount: edit.items.length,
                      itemBuilder: (context, index) {
                        final data = edit.items[index];

                        return ListItem(
                            key: ValueKey(data), index: index, data: data);
                      }),
                ),
              ),
              Positioned(
                bottom: 0,
                // alignment: Alignment.bottomCenter,
                child: Container(
                  width: width, //MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    // border:Border(top:BorderSide(width: 1) ),
                  ),
                  //  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text('\$${edit.total}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: width - 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color.fromARGB(255, 15, 88, 147),//Colors.blue,
                                border: Border.all(width: 1)),
                            child: TextButton(
                                onPressed: () {}, child: Text('Place Order',style: TextStyle(color: Colors.white),))),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 15, 88, 147),
              onPressed: () {
                edit.addItem();
                // items.add()
              },
              child: Icon(Icons.add,color: Colors.white,),
            ),
          ),
        ),
      );
    });
  }
}
