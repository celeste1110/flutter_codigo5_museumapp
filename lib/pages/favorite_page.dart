import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class FavoritePage extends StatelessWidget {
  _generatePDF() async {
    ByteData bytex = await rootBundle.load('assets/images/slider1.jpeg');
    Uint8List imagesBytes = bytex.buffer.asUint8List();
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            // return pw.Image(pw.MemoryImage(imagesBytes));
            return pw.Table(
              children: [
                pw.TableRow(
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(
                          pw.MemoryImage(imagesBytes),
                        ),
                        pw.Container(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text('hola'),
                              pw.Text('hola'),
                              pw.Text('hola'),
                              pw.Text('hola'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Divider()
                  ],
                ),
              ],
            );
          }),
    );
    // pdf.addPage(
    //   pw.MultiPage(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context){
    //       return [
    //         pw.Text('sff'),
    //       ];
    //     }
    //   )
    // );

    Uint8List bytes = await pdf.save();
    Directory dir = await getApplicationDocumentsDirectory();

    File _file = File("${dir.path}/example2PDF.pdf");
    _file.writeAsBytes(bytes);
    await OpenFile.open(_file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _generatePDF();
            },
            child: Text(
              "Generar PDF",
            ),
          ),
        ],
      ),
    );
  }
}
