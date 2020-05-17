import 'dart:collection';
import 'dart:io';
import 'dart:isolate';
import 'package:untitled/untitled.dart';
import 'extern.dart';



// enum
enum day{
  MONDAY,
  TUESDAY
}

void main() {
  double x = 1.34;
  var aList = [1,2,3,4];
  for (var k in aList){
    print("The current value is ${k}");
  }

  var aList2 = ['a', 'b'];
  for(var i = 0; i< aList2.length; i++){
    switch(aList2[i]){
      case 'a': {
        print("The current switch value is ${aList2[i]}");
      }
      break;
      case 'b': {
        print("The current switch value is ${aList2[i]}");
      }
      break;
    }
  }

  // List ini with fix length
  var list_ini = new List(3);
  list_ini[2] = "donkey";
  print("My list contain ${list_ini}");

  // List ini with dynamic length
  list_ini = new List();
  list_ini.add("dog");
  print("My new list contain ${list_ini}");
  print("My last list contain ${list_ini.last}");
  list_ini.remove("dog");
  print("After removing dog list contain ${list_ini}");

  // enumerate
  print (day.values);
  day.values.forEach((element) => print(' ${element.index} : $element'));


  // Map declare and ini
  var jsonMap =
      {
        'Name': 'Chan kian ann',
        'Age': '28'
      };

  print ("My current Map data is ${jsonMap}");
  print("Map Name is ${jsonMap['Name']}");

  // Map declare
  jsonMap = new Map();
  jsonMap['Name'] = 'Chan Kian Ann 2';
  jsonMap['Age'] = '29';
  print ('My new Map data contains ${jsonMap}');
  print ('My keys in Map are ${jsonMap.keys}');
  print ('My value in Map are ${jsonMap.values}');
  print ('My Map key-value lngth is ${jsonMap.length}');
  jsonMap.addAll({'state': 'jobless', 'hobby': 'computing'});
  print('My new Map data are ${jsonMap}');
  jsonMap.forEach((key, value) => print('${key}: ${value}'));
  jsonMap.remove('Age');
  print('The new Map data after removing age key are ${jsonMap}');
  jsonMap.clear();
  print('The new Map data after clearing are ${jsonMap}');

  // Call functon
  CallFunction();
  print(CallFunctionWithRetValue());
  CallFunctionWithPara(1,1);
  CallFunctionWithOptionalPositionalPara(1);
  OptionalNamedPara(123, n3:5);
  OptionalDefaultValue(123);
  lambdaFunction();

  // Class
  // define a constructor
  Money moneyObj = new Money();
  moneyObj.getName();
  moneyObj.setValue("Taiwan Dollar", "TWD", 1.3);
  moneyObj.getName();

  // Class interitence
  Savings savingsObj = new Savings();
  savingsObj.getName();
  savingsObj.setValue('Cryptocurrency', 'CTO', 4.5);
  Rebate rebateObj = new Rebate();
  rebateObj.getName();
  rebateObj.setValue('Central Provisional Fund', 'CPF', 1.2);

  // Class Override
  savingsObj.getValue();
  rebateObj.getValue();

  //static memory
  staticMemory.num  = 45;
  staticMemory.method();

  // super keyword
  testSuper superObj = new testSuper();
  superObj.getValue();

  // interfaces
  mainInterface Interfaceobj = new mainInterface();
  print('Addition of 5 and 5 is ${Interfaceobj.addition(5)}');
  print('Multiplier of 5 and 5 is ${Interfaceobj.multiplier(5)}');

  // Collection
  List objList = new List();
  objList.add('A');
  objList.add('B');
  for (String val in objList){
    print('Current item in list is ${val}');
  }

  //Set ->Appear once
  Set objSet = new Set();
  objSet.add('2');
  objSet.add('5');
  for (var x in objSet){
    print ('Current Set value is ${x}');
  }

  objSet = new Set.from(['10', '20']);
  for (var x in objSet){
    print ('Current ForEach Set value is ${x}');
  }

  // HashMap
  HashMap dataHash = new HashMap();
  dataHash.addAll({'Name': 'Chan Kian Ann', 'Age': 29});
  print ('Current HashMap data is ${dataHash}');
  dataHash.remove('Age');
  print ('Current HashMap data after removing age is ${dataHash}');
  dataHash.clear();
  print ('Current HashMap data after clear is ${dataHash}');

  //HashSet
  HashSet dataSet = new HashSet();
  dataSet.addAll([1,2,10]);
  dataSet.remove(2);
  print ('Current HashSet data after removing 2 is ${dataSet}');
  dataSet.clear();
  print ('Current HashSET data after clear is ${dataSet}');

  // Queue
  Queue dataQueue = new Queue();
  dataQueue.add(1);
  dataQueue.addAll([2,3,5]);
  print ('current Queue data is ${dataQueue}');
  dataQueue.addFirst(20);
  dataQueue.addLast(50);
  print ('current Queue data is ${dataQueue}');

  // Iterate Collection/ Queue
  Iterator i = dataQueue.iterator;
  while (i.moveNext()){
    print('Current iterator value is ${i.current}');
  }

  // Specific type Collection
  List <String> ListGeneric = new List <String>();
  ListGeneric.addAll(['1','2']);
  ListGeneric.forEach((element) => print('Current ListGeneric data is $element'));

  // Generic Map
  Map <String, String> GenericMap = new Map<String, String>();
  GenericMap.addAll({'FName': 'Kian Ann', 'Last Name': 'Chan'});
  print(GenericMap);

  //try catch error
  try{
    var a = 1;
    a = a ~/0;
  }catch(e){
    print(e);
  }

  // typedef
  defineOperation typeDef;
  typeDef = TypeDefCPFContribution (3300, 800);
  typeDef = TypeDefSavings(3300, 800);
  // passed typedef as a parameter to function
  Calculator(3300, 800, TypeDefSavings);

  // Accessing class from external Dart file
  externClass externObj = new externClass();
  externObj.getString();

  // async ops
  print ('Enter a name');
  String asyncName = stdin.readLineSync();
  print ('You input ${asyncName} and length is ${asyncName.length}');

  // file io
  print (Directory.current.path);
  File FileObj = new File(Directory.current.path+'\\example\\sample.txt');
  // async method, will get back to you when the data is comepleted
  Future <String> f = FileObj.readAsString();
  f.then((value) => print(value));
  print ('Your file is processing!');

}

// function
void CallFunction(){
  print('Helllo');
}

String CallFunctionWithRetValue(){
  return "Return string from function!";
}

void CallFunctionWithPara(int val1, int val2){
  int total = val1 + val2;
  print('The sum of ${val1} and ${val2} is ${total}');
}

void CallFunctionWithOptionalPositionalPara(a, [b]){
  print ('The 2 value obtain is ${a} and ${b}');
}

void OptionalNamedPara(n1, {n2, n3}){
  print('The Optional Name para value are ${n1}, ${n2} and ${n3}!');
}

void OptionalDefaultValue(n1, {n2:1, n3:2}){
  print ('Sum of ${n1}, ${n2} and ${n3} is ${n1+n2+n3}');
}

lambdaFunction() => print ('The value of 5*5 is ${5*5}');

// Class
class Money {
  // class variable
  String Name;
  String Code;
  double rate;

  // Default Constructor
  Money(){
    Name= "Singapore Dollar";
    Code = "SGD";
    rate = 2.5;
  }

  // Class Method
  String getName(){
    print ('The Name of the currency is ${Name}');
  }

    void setValue(name, Code, rate){
      this.Name = name;
      this.Code = Code;
      this.rate = rate;
    }
}

class Savings extends Money{
  int type = 1;
  double value = 1.3;

  void getValue(){
    print ("The investment ${type} and value is ${value}");
  }
}

class Rebate extends Savings{
  int type = 2;
  double value = 2.5;

  @override
  void getValue(){
    print ("The investment ${type} and value is ${value}");
  }
}

class staticMemory{
  static int num;
  static method(){
    print('The static value is ${num}');
  }
}

class testSuper extends Savings{
  @override
  void getValue(){
    super.type = 10;
    print ("Updating parent variable and the value becomes ${super.type}");
  }
}

class mainInterface implements interfaceb, interfacec{
  int addition(n) {
    // TODO: implement data
    return n + n;
  }

  int multiplier(n) {
    return n * n;
  }
}

class interfaceb{int addition(int n){}}
class interfacec{int multiplier(int n){}}

typedef defineOperation(double income, double spendings);
TypeDefCPFContribution(double income, doubleSpendings){
  print ("Your Salary is ${income} and CPF contributuin amount is ${income *0.2}");
}

TypeDefSavings(double income, double Spendings){
  print ("Your Salary is ${income} and Savings is ${(income *0.8) - Spendings}");
}

Calculator(double income, double spendings, defineOperation ops){
  ops(income, spendings);
}

