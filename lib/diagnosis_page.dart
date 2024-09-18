import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiagnosisPage extends StatefulWidget{
  const DiagnosisPage ({super.key});

  @override
  State<StatefulWidget> createState() => DiagnosisPageState();
}

class DiagnosisPageState extends State<DiagnosisPage> {

  TextEditingController controller_extra_details =TextEditingController();
  TextEditingController controller_diagnosis_details =TextEditingController();
  TextEditingController controller_phoneNumber =TextEditingController();
  TextEditingController controller_patientName =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60.w,
        title: Text(
          "Diagnosis info",
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.w, right: 10.w, left: 10.w),
                  child: Column(
                    children: [
                      TextField(
                        controller:controller_diagnosis_details ,
                        maxLines: 6,
                        decoration:  InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: const OutlineInputBorder(),
                          hintText: "Describe about the diagnosis",
                          hintStyle: const TextStyle(color: Colors.black26),
                          labelStyle: TextStyle(fontSize: 20.sp),
                          label: const Text("Diagnosis details"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child:  TextField(
                          maxLines: 6,
                          controller: controller_extra_details,
                          decoration:  InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: const OutlineInputBorder(),
                            hintText: "Describe additional information",
                            hintStyle: const TextStyle(color: Colors.black26),
                            labelStyle: TextStyle(fontSize: 20.sp),
                            label: const Text("Additional info"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child:  TextField(
                          controller: controller_phoneNumber,
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration:  InputDecoration(
                              border: const OutlineInputBorder(),
                              labelStyle: TextStyle(fontSize: 20.sp),
                              hintText: "07********",
                              hintStyle: TextStyle(fontSize: 14.sp,color: Colors.black38),
                              labelText: "Patient mobile number (app registered)"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child:  TextField(
                          controller: controller_patientName,
                          decoration:  InputDecoration(
                              border: const OutlineInputBorder(),
                              labelStyle: TextStyle(fontSize: 20.sp),
                              labelText: "Patient name"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  backgroundColor: const Color.fromRGBO(78, 131, 218, 1.0),
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstPage()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // backgroundColor: const Color.fromRGBO(23, 64, 124, 1.0),
                  backgroundColor: Color.fromRGBO(8, 43, 69, 1.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                ),
                onPressed: () {
                  if(controller_diagnosis_details.text.trim().toString() == "" ){
                    showAlertDialog(context,"Diagnosis details must be provided.");
                  }else if(controller_patientName.text.trim().toString() == "" || controller_phoneNumber.text.trim().toString() == "" ){
                    showAlertDialog(context,"Patient details should be provided");
                  }else if(controller_phoneNumber.text.trim().toString().length != 10){
                    showAlertDialog(context,"Incorrect phone number");
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context,String detail) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.w)))
    ),
    child: Text("Got it",style:TextStyle(fontSize: 15.sp,color: Colors.red,fontWeight: FontWeight.bold)),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.red,
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
    content: Text(detail,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white),),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}