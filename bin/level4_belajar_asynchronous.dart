import 'package:level4_belajar_asynchronous/level4_belajar_asynchronous.dart'
    as level4_belajar_asynchronous;
/*
 3 jenis status
 1. Uncompleted
 2. Completed -> data (sukses)
 3. Completed -> error (tidak sukses)
*/

void main() {
  // dataDelay();
  // print(getOrder(2));
  getOrder(10).then(
    (String status) {
      print('Dijalankan');
      print(status);
    }
  ).catchError((error){
    print('Yang ini dijalankan');
    print(error);
  });
  pertama();
  kedua();
}

void pertama() {
  print('Data 1');
}

void kedua() {
  print('Data 2');
}

void dataDelay() {
  //async
  Future.delayed(Duration(seconds: 2), () {
    print('Data yang delay');
    print('Status Completed');
  });
}

Future<String> getOrder(int beli) {
  int stok = 5;

  return Future.delayed(Duration(seconds: 2), () {
    if (stok >= beli) {
      //berhasil membeli barang
      return 'Berhasil membeli barang sebanyak $beli';
    } else {
      //stok kurang & tidak berhasil
      throw 'Tidak berhasil membeli barang karena stok kurang';
    }
  });
}
