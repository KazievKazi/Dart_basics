void main(List<String> args) {
  DelimetersCalculator calculate = DelimetersCalculator();

  print(calculate.nod(72, 21));
  print(calculate.nok([9, 12, 56, 89]));
  print(calculate.numberByPrimeFactors(52, []));
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
