import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/widgets/Button.dart';

class ListViewTile extends StatefulWidget {
  String from, to, time, price, id, customerAgree, serviceType;
  ListViewTile(
      {this.from,
      this.to,
      this.price,
      this.time,
      this.id,
      this.customerAgree,
      this.serviceType});

  @override
  _ListViewTileState createState() => _ListViewTileState();
}

class _ListViewTileState extends State<ListViewTile> {
  TextStyle greyText = TextStyle(fontSize: 16, color: Colors.grey.shade600);

  TextStyle yellowText = TextStyle(fontSize: 16, color: Color(0xFFff971d));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reference ID",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  widget.id,
                  style: greyText.copyWith(fontSize: 12),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From",
                  style: greyText.copyWith(color: Colors.black),
                ),
                Text(
                  widget.from,
                  style: greyText,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "To",
                  style: greyText.copyWith(color: Colors.black),
                ),
                Text(
                  widget.to,
                  style: greyText,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Service Type",
                  style: greyText.copyWith(color: Colors.black),
                ),
                Text(
                  widget.serviceType,
                  style: greyText,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Requested Time",
                  style: greyText.copyWith(color: Colors.black),
                ),
                Text(
                  widget.time,
                  style: greyText,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quoted Price",
                  style: greyText.copyWith(color: Colors.black),
                ),
                Text(
                  widget.price == null ? "Awaiting" : "\$ ${widget.price}",
                  style: widget.price == null
                      ? yellowText
                      : yellowText.copyWith(color: Colors.green),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Button(
                  text:
                      (widget.customerAgree == "false") ? "Canceled" : "Cancel",
                  onpressed: (widget.customerAgree == "false")
                      ? null
                      : () async {
                          var result = await auth.updateRequest(
                              widget.id, "Customer Agreed", "false");
                          var result2 = await auth.updateRequest(
                              widget.id, "Canceled", "true");
                          if (result && result2) {
                            setState(() {
                              widget.customerAgree = "false";
                            });
                          }
                        },
                  padding: 10,
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Button(
                  text: (widget.customerAgree != "true")
                      ? "Agree To Price"
                      : "✔ Booked",
                  onpressed:
                      (widget.price == null || widget.customerAgree == "false")
                          ? null
                          : () async {
                              bool result = await auth.updateRequest(
                                  widget.id, "Customer Agreed", "true");
                              if (result) {
                                setState(() {
                                  widget.customerAgree = "true";
                                });
                              }
                            },
                  color: Colors.green,
                  padding: 10,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
