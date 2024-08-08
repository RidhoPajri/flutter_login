import 'package:flutter/material.dart';
import 'package:myapp/model/kategori_model.dart';
import 'package:myapp/model/kategori_model.dart';
import '../pages/services/kategori_service.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  final KategoriService _kategoriService = KategoriService();
  kategori? _kategori;

  @override
  void initState() {
    super.initState();
    _fetchKategori();
  }

  void _fetchKategori() async {
    kategori? Kategori = await _kategoriService.fetchKategori();
    setState(() {
      _kategori = Kategori;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: _kategori == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _kategori?.data?.length ?? 0,
              itemBuilder: (context, index) {
                Data kategori = _kategori!.data![index];
                return ListTile(
                  title: Text(kategori.namaKategoris ?? 'Tidak Ada'),
                  // subtitle: Text(kategori.slug ?? ''),
                );
              },
            ),
    );
  }
}
