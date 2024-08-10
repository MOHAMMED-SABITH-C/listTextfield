import 'package:flutter/material.dart';
import 'package:primal1/providers.dart';
import 'package:provider/provider.dart';

class ListItem extends StatefulWidget {
  final int index;
  // final Map<String, dynamic> data;
  final Items data;

  ListItem({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late TextEditingController _productName;
  late TextEditingController _priceController;
  late FocusNode _productNameFocusNode;
  late FocusNode _priceFocusNode;
  late String Pname = '';
  late String Price = '';

  // late Items  data;//Provider.of<Change>(context, listen: false).items[widget.index];
  @override
  void initState() {
    super.initState();
    // data=Provider.of<Change>(context, listen: false).items[widget.index];
    Pname = widget.data.ProductName;
    Price = widget.data.Price;
    _productName = TextEditingController(text: Pname);
    _priceController = TextEditingController(text: Price);
    _productNameFocusNode = FocusNode();
    _priceFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _productName.dispose();
    _priceController.dispose();
    _productNameFocusNode.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(builder: (context, edit, child) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(35, 0, 0, 0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _productNameFocusNode,
                  // text
                  controller: _productName,
                  onChanged: (value) {
                    edit.items[widget.index].ProductName = value;
                    // Pname=value;//_productName.text.trim();
                    // edit.updateItem(widget.index, value, _priceController.text.trim());
                  },
                  decoration: InputDecoration(
                      hintText: 'Product Name', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(35, 0, 0, 0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: _priceFocusNode,
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Price',
                      fillColor: const Color.fromARGB(255, 24, 112, 184)),
                  onSubmitted: (text) {
                    edit.updateItem(
                        widget.index, _productName.text.trim(), text);
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                edit.delete(widget.index);

                // edit.updateItem(widget.index, _productName.text.trim(), _priceController.text.trim());
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
      );
    });
  }
}
