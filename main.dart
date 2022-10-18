import 'dart:math' as Math;

void main(List<String> args) {
  // DelimetersCalculator calculate = DelimetersCalculator();
  WorkingWithConversion conversion = WorkingWithConversion();

  // print(calculate.nod(72, 21));
  // print(calculate.nok([9, 12, 56, 89]));
  // print(calculate.numberByPrimeFactors(52, []));
  print(conversion.decimalToBinary(810, []));
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
