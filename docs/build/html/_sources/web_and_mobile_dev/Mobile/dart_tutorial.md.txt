# Dart tutorial

## Language tour

### Basic Dart Program

```dart
// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console. $aNumber is string interpolation, just put the variable's content as a string 
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```
### Important concepts

1. Dart is object-oriented: Everything you can place in a variable is an object, and every object is an instance of a class. Even numbers, functions, and null are objects. All objects inherit from the Object class.
2. Dart is strongly typed but type annotations are optional because Dart can infer types. 


> **Object vs dynamic:** never use dynamic: Two types in Dart permit all values: Object and dynamic. However, they convey different things. If you simply want to state that you allow all objects, use Object, as you would in Java or C#. Using dynamic sends a more complex signal. It may mean that Dart’s type system isn’t sophisticated enough to represent the set of types that are allowed

3. Private variables in dart: Unlike Java, Dart doesn’t have the keywords public, protected, and private. If an identifier starts with an underscore (_), it’s private to its library.

### Variables

```dart
var x = 'Bob'; // String type inferred
String y = 'Bob'; // Explicitely declaring type String
Object z = 'Bob'; // z is not restricted to a single type now
```
Variables store references. The variable called x contains a reference to a String object with a value of “Bob”.

## Useful tools:
You can run dart code online on https://dartpad.dartlang.org/