import 'package:flutter/material.dart';
import 'package:a2_h1d021005/ikan.dart';
import 'package:a2_h1d021005/ui/ikan_form.dart';
import 'package:a2_h1d021005/ikan_bloc.dart';
import 'package:a2_h1d021005/ui/ikan_page.dart';

 class IkanDetail extends StatefulWidget {
  Ikan? ikan;

  IkanDetail({Key? key, this.ikan}) : super(key: key);

  @override
 _IkanDetailState createState() => _IkanDetailState();
 }

 class _IkanDetailState extends State<IkanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Ikan (Alifa)'),
      ),
      body: Center( child: 
        Column(
          children: [ 
            Text(
            "Nama : ${widget.ikan!.nama}",
            style: const TextStyle(fontSize: 20.0),
            ),
            Text(
            "Jenis : ${widget.ikan!.jenis}",
            style: const TextStyle(fontSize: 18.0),
            ),
            Text(
            "Warna : ${widget.ikan!.warna}",
            style: const TextStyle(fontSize: 18.0),
            ),
            Text(
            "Habitat : ${widget.ikan!.habitat}",
            style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
            ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
        //Tombol Edit
          OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) => IkanForm(
                    ikan: widget.ikan!,
                ))
              );
            }
          ),
          //Tombol Hapus
          OutlinedButton(
          child: const Text("DELETE"), onPressed: () => confirmHapus()),
        ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () async {
            try {
              await IkanBloc.deleteIkan(id: widget.ikan?.id);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const IkanPage()));
            } catch (e) {
              print(e);
            }
          },
        ),
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
 }
