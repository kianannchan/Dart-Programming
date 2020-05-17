import 'package:test/test.dart';
import 'basicDart.dart';
// Import the test package

int Add(int x,int y) {
return x+y;
}

void main() {
  group("Test interface with", ()
  {
    // Define the test
    test("Check multiplier value", () {
      mainInterface inter = new mainInterface();
      var actual = inter.multiplier(5);
      expect(actual, 25);
    });

    test("Check addition value", () {
      mainInterface inter = new mainInterface();
      var actual = inter.addition(5);
      expect(actual, 10);
    });
  });
}