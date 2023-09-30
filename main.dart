import 'dart:math' as Math;

void main(List<String> args) {
  // DelimetersCalculator calculate = DelimetersCalculator();
  // WorkingWithConversion conversion = WorkingWithConversion();
  // WorkingWithString checkString = WorkingWithString();
  Point checkString = Point();

  // print(calculate.nod(72, 21));
  // print(calculate.nok([9, 12, 56, 89]));
  // print(calculate.numberByPrimeFactors(52, []));
  // print(conversion.decimalToBinary(810, []));
  // print(checkString.stringToNum('one 2 three 4 five 6 seven 8 nine 10', []));
  // print(checkString.collectionToMap( ['Red', 'Blue', 'Orange', 'Blue', 'Orange', 'Orange', 'Red', 'Blue'], {}));
  // print(checkString.stringToList(['one', 'two', 'three', 'cat', 'dog', 'zero', 'zero'], []));
  print(checkString.distanceTo(1, 3, 5));
}

class DelimetersCalculator {
  int nod(int a, int b) {
    if (b == 0) return a.abs();

    return nod(b, a % b);
  }

  int nok(List<int> array) {
    return array.reduce((a, b) => (a * b) ~/ nod(a, b));
  }

  List<int> numberByPrimeFactors(int number, List<int> arr) {
    if (number == 1) return arr;

    for (int i = 2; i <= number; i++) {
      if (number % i == 0) {
        arr.add(i);
        return numberByPrimeFactors(number ~/ i, arr);
      }
    }

    return arr;
  }
}

class WorkingWithConversion {
  List<int> decimalToBinary(int number, List<int> array) {
    while (number != 0) {
      array.add((number / 2) % 1 == 0 ? 0 : 1);

      return decimalToBinary(number ~/ 2, array);
    }

    binaryToDecimal(array, 0);
    return array;
  }

  int binaryToDecimal(List<int> array, int num) {
    for (int i = 0; i < array.length; i++) {
      num += (Math.pow(2, i)).toInt() * array[i];
    }
    print(num);
    return num;
  }
}

class WorkingWithString {
  bool _isNumeric(String str) {
    if (str == Null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  List<dynamic> stringToNum(String text, List<int> arrayList) {
    List array = text.split(' ');

    for (int i = 0; i < array.length; i++) {
      if (_isNumeric(array[i])) {
        arrayList.add(int.parse(array[i]));
      }
    }
    return arrayList;
  }

  Map<String, int> collectionToMap(List<String> array, Map<String, int> obj) {
    for (int i = 0; i < array.length; i++) {
      if (obj[array[i]] != null) {
        obj[array[i]] = obj[array[i]]! + 1;
      } else {
        obj[array[i]] = 1;
      }
    }
    return obj;
  }

  List<int> stringToList(List<String> arrText, List<int> array) {
    Map<String, int> numberList = {
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'sevet': 7,
      'eght': 8,
      'nine': 9
    };

    for (int i = 0; i < arrText.length; i++) {
      if (numberList[arrText[i]] != null) {
        array.add(numberList[arrText[i]]!.toInt());
      }
    }
    return array.toSet().toList();
  }
}

class Point {
  final x = 0;
  final y = 0;
  final z = 0;

  double distanceTo(int x, int y, int z) {
    // print((x - this.x) ^ 2);
    // print((y - this.y) ^ 2);
    // print((z - this.z) ^ 2);
    // print(((x - this.x) ^ 2) + ((y - this.y) ^ 2) + ((z - this.z) ^ 2));

    return Math.sqrt(((x - this.x) ^ 2) + ((y - this.y) ^ 2) + ((z - this.z) ^ 2));
  }

  //  d = √((x2 — x1)^2 + (y2 — y1)^2 + (z2 — z1)^2)
}
