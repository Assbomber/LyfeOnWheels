import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:lyfeonwheels/constants.dart';
import 'package:lyfeonwheels/widgets/Button.dart';
import 'package:lyfeonwheels/widgets/CustomDropDown.dart';
import 'package:lyfeonwheels/widgets/Textfield.dart';

class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String fullname,
      phone,
      age,
      weight,
      pickAddress,
      pickCity,
      pickPin,
      dataTime,
      dropAddress,
      dropCity,
      noOfPerson,
      dropPin;
  String currentValue;
  bool disableButton = false;
  List<String> list = [
    "Walking (Ambulatory)",
    "Walking (With Assistance)",
    "Wheelchair (To Van Seat)",
    "Wheelchair (Confined)",
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (cont) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Book your ride!',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '*All fields are mandatory',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      prefixicon: Icon(Icons.person),
                      obscure: false,
                      hintText: "Full Name",
                      onchange: (string) {
                        fullname = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      textInputType: TextInputType.phone,
                      prefixtext: "+1",
                      prefixicon: Icon(Icons.phone),
                      obscure: false,
                      hintText: "Phone Number",
                      onchange: (string) {
                        phone = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      textInputType: TextInputType.number,
                      maxLength: 3,
                      obscure: false,
                      hintText: "Number of person",
                      prefixicon: Icon(Icons.supervisor_account),
                      onchange: (string) {
                        noOfPerson = string;
                      },
                    ),
                    CustomDropDown(
                      currentValue: currentValue,
                      hinttext: "Choose Service Type",
                      list: list,
                      onchange: (string) {
                        setState(() {
                          currentValue = string;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Textfield(
                            textInputType: TextInputType.number,
                            maxLength: 3,
                            obscure: false,
                            hintText: "Age",
                            prefixicon: Icon(Icons.ac_unit),
                            onchange: (string) {
                              age = string;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Textfield(
                            textInputType: TextInputType.number,
                            maxLength: 3,
                            obscure: false,
                            hintText: "Approx Weight (lbs)",
                            prefixicon: Icon(Icons.line_weight),
                            onchange: (string) {
                              weight = string;
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.blue,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pickup Location",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      obscure: false,
                      hintText: "Address",
                      prefixicon: Icon(Icons.location_on),
                      onchange: (string) {
                        pickAddress = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      obscure: false,
                      hintText: "City and State",
                      prefixicon: Icon(Icons.location_city),
                      onchange: (string) {
                        pickCity = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      textInputType: TextInputType.number,
                      obscure: false,
                      hintText: "Pin Code",
                      prefixicon: Icon(Icons.location_on),
                      onchange: (string) {
                        pickPin = string;
                      },
                    ),
                    DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'd MMM, yyyy',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      onChanged: (val) {
                        dataTime = val;
                      },
                    ),
                    Divider(
                      color: Colors.blue,
                      thickness: 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Drop Location",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      obscure: false,
                      hintText: "Address",
                      prefixicon: Icon(Icons.location_on),
                      onchange: (string) {
                        dropAddress = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      obscure: false,
                      hintText: "City and State",
                      prefixicon: Icon(Icons.location_city),
                      onchange: (string) {
                        dropCity = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textfield(
                      textInputType: TextInputType.number,
                      obscure: false,
                      hintText: "Pin Code",
                      prefixicon: Icon(Icons.location_on),
                      onchange: (string) {
                        dropPin = string;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Button(
            text: "Submit Request",
            onpressed: disableButton
                ? null
                : () async {
                    if (fullname == null ||
                        phone == null ||
                        age == null ||
                        weight == null ||
                        noOfPerson == null ||
                        pickAddress == null ||
                        pickCity == null ||
                        pickPin == null ||
                        dropAddress == null ||
                        dropCity == null ||
                        dropPin == null ||
                        currentValue == null) {
                      Scaffold.of(cont).showSnackBar(
                          SnackBar(content: Text("All fields are mandatory")));
                    } else if (dataTime == null) {
                      Scaffold.of(cont).showSnackBar(SnackBar(
                          content: Text("Default Date/Time cannot be used.")));
                    } else {
                      setState(() {
                        disableButton = true;
                      });
                      try {
                        bool result = await auth.postRequest(
                            fullname,
                            phone,
                            age,
                            weight,
                            pickAddress,
                            pickCity,
                            pickPin,
                            dataTime,
                            dropAddress,
                            dropCity,
                            dropPin,
                            noOfPerson,
                            currentValue);
                        if (result) {
                          setState(() {
                            disableButton = false;
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext coxtext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  actions: [
                                    Align(
                                      child: Image.asset(
                                        "images/tickGif.gif",
                                        width: 100,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Align(
                                      child: Text(
                                        "Request has been successfully submitted. You can check your status in the status tab",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.center,
                                      ),
                                      alignment: Alignment.center,
                                    )
                                  ],
                                );
                              });
                        }
                      } catch (e) {
                        setState(() {
                          disableButton = false;
                        });
                        Scaffold.of(cont).showSnackBar(SnackBar(
                            content: Text(
                                "Some Issue caused at backend, Please try again later.")));
                      }
                    }
                  },
          )
        ],
      ),
    );
  }
}
