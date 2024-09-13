import 'dart:io';

void main() {
  print("Son kirit: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    try {
      double result = hisobla(input); 
      print('Natija: $result');
    } catch (e) {
      print(
          'Xato: Matematik ifodani to\'g\'ri kiriting.'); 
    }
  } else {
    print('Iltimos, ifodani kiriting.');
  }
}

double hisobla(String ifoda) {
  return ifodaTahlil(ifoda);
}

double ifodaTahlil(String ifoda) {
  ifoda = ifoda.replaceAll(' ', '');
  if (ifoda.contains('(')) {
    int boshQavs = ifoda.lastIndexOf('(');
    int yopiqQavs = ifoda.indexOf(')', boshQavs);
    String qavsIchida = ifoda.substring(boshQavs + 1, yopiqQavs);
    double qavsNatija = ifodaTahlil(qavsIchida);
    ifoda = ifoda.replaceRange(boshQavs, yopiqQavs + 1, qavsNatija.toString());
    return ifodaTahlil(ifoda);
  }

  int kopaytirish = ifoda.indexOf('*');
  int bolish = ifoda.indexOf('/');
  if (kopaytirish != -1 || bolish != -1) {
    int amal = (kopaytirish != -1) ? kopaytirish : bolish;
    String chap = ifoda.substring(0, amal).trim();
    String ong = ifoda.substring(amal + 1).trim();

    double chapQiymat = ifodaTahlil(chap);
    double ongQiymat = ifodaTahlil(ong);

    if (ifoda[amal] == '*') {
      return chapQiymat * ongQiymat;
    } else if (ifoda[amal] == '/') {
      return chapQiymat / ongQiymat;
    }
  }

  int qoshish = ifoda.indexOf('+');
  int ayrish = ifoda.indexOf('-');
  if (qoshish != -1 || ayrish != -1) {
    int amal = (qoshish != -1) ? qoshish : ayrish;
    String chap = ifoda.substring(0, amal).trim();
    String ong = ifoda.substring(amal + 1).trim();

    double chapQiymat = ifodaTahlil(chap);
    double ongQiymat = ifodaTahlil(ong);

    if (ifoda[amal] == '+') {
      return chapQiymat + ongQiymat;
    } else if (ifoda[amal] == '-') {
      return chapQiymat - ongQiymat;
    }
  }

  return double.parse(ifoda);
}
