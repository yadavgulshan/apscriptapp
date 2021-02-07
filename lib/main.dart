import 'dart:io';

import 'package:apscriptapp/pages/resume.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pdf = pw.Document();
  writeOnPdf() {
    pdf.addPage(
      pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(
                level: 0,
                child: pw.Text('Resume'),
              ),
              pw.Paragraph(
                  text:
                      'Officia sit laborum mollit cupidatat sit tempor fugiat sint veniam magna officia aliquip Lorem eu. Enim dolore cupidatat incididunt excepteur nulla duis laborum proident ex aliquip anim enim quis. Qui et incididunt culpa nostrud fugiat. Reprehenderit qui ad et deserunt enim laboris nulla incididunt et enim aliqua. Irure aliquip amet et sunt irure aliquip fugiat dolor culpa ipsum. Ullamco eiusmod aliqua sit id laborum mollit Lorem ad enim.'),
              pw.Paragraph(
                  text:
                      'Officia sit laborum mollit cupidatat sit tempor fugiat sint veniam magna officia aliquip Lorem eu. Enim dolore cupidatat incididunt excepteur nulla duis laborum proident ex aliquip anim enim quis. Qui et incididunt culpa nostrud fugiat. Reprehenderit qui ad et deserunt enim laboris nulla incididunt et enim aliqua. Irure aliquip amet et sunt irure aliquip fugiat dolor culpa ipsum. Ullamco eiusmod aliqua sit id laborum mollit Lorem ad enim.'),
              pw.Paragraph(
                  text:
                      'Officia sit laborum mollit cupidatat sit tempor fugiat sint veniam magna officia aliquip Lorem eu. Enim dolore cupidatat incididunt excepteur nulla duis laborum proident ex aliquip anim enim quis. Qui et incididunt culpa nostrud fugiat. Reprehenderit qui ad et deserunt enim laboris nulla incididunt et enim aliqua. Irure aliquip amet et sunt irure aliquip fugiat dolor culpa ipsum. Ullamco eiusmod aliqua sit id laborum mollit Lorem ad enim.'),
            ];
          }),
    );
  }

  Future savepdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File('$documentPath/example.pdf');
    file.writeAsBytesSync(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'pdf tuturial',
                style: TextStyle(fontSize: 34),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            writeOnPdf();
            await savepdf();
            Directory documentDirectory =
                await getApplicationDocumentsDirectory();
            String documentPath = documentDirectory.path;
            String fullPath = '$documentPath/example.pdf';
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PdfPreview(path: fullPath)));
          },
          child: Icon(Icons.save),
        ));
  }
}
