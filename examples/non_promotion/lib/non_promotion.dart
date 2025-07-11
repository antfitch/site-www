// ignore_for_file: unused_local_variable, unused_element
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_if_null_operators

// #docregion not-field, conflicting-getter
import 'dart:math';
// #enddocregion not-field, conflicting-getter

// #docregion mock
import 'package:mockito/mockito.dart';
// #enddocregion mock

class C1 {
  int? i;
  void f() {
    if (i == null) return;
    // #docregion property-bang
    print(i!.isEven);
    // #enddocregion property-bang
  }
}

// #docregion property-copy
class C {
  int? i;
  void f() {
    final i = this.i;
    if (i == null) return;
    print(i.isEven);
  }
}
// #enddocregion property-copy

class Link {
  final value = 0;
  late Link next;
}

void miscDeclAnalyzedButNotTested() {
  {
    // #docregion write-combine-ifs
    void f(bool b, int? i, int? j) {
      if (i == null) return;
      if (b) {
        i = j;
      } else {
        print(i.isEven);
      }
    }

    // #enddocregion write-combine-ifs
  }

  {
    // #docregion write-change-type
    void f(bool b, int? i, int j) {
      if (i == null) return;
      if (b) {
        i = j;
      }
      if (!b) {
        print(i.isEven);
      }
    }

    // #enddocregion write-change-type
  }

  {
    // #docregion loop
    void f(Link? p) {
      while (p != null) {
        print(p.value);
        p = p.next;
      }
    }

    // #enddocregion loop
  }

  {
    // #docregion switch-loop
    void f(int i, int? j, int? k) {
      switch (i) {
        label:
        case 0:
          if (j == null) return;
          print(j.isEven);
          j = k;
          continue label;
      }
    }

    // #enddocregion switch-loop
  }

  {
    void f(int? i, int? j) {
      if (i == null) return;
      // #docregion catch-null-check
      try {
        // #enddocregion catch-null-check
        i = j; // (1)
        // ... Additional code ...
        if (i == null) return; // (2)
        // ... Additional code ...
        // #docregion catch-null-check
      } catch (e) {
        if (i != null) {
          print(i.isEven); // (3) OK due to the null check in the line above.
        } else {
          // Handle the case where i is null.
        }
      }
      // #enddocregion catch-null-check
    }
  }

  {
    void f(int? i, int? j) {
      if (i == null) return;
      // #docregion catch-bang
      try {
        // #enddocregion catch-bang
        i = j; // (1)
        // ... Additional code ...
        if (i == null) return; // (2)
        // ... Additional code ...
        // #docregion catch-bang
      } catch (e) {
        print(i!.isEven); // (3) OK because of the `!`.
      }
      // #enddocregion catch-bang
    }
  }

  {
    // #docregion subtype-variable
    void f(Object o) {
      if (o is Comparable /* (1) */ ) {
        Object o2 = o;
        if (o2 is Pattern /* (2) */ ) {
          print(
            o2.matchAsPrefix('foo'),
          ); // (3) OK; o2 was promoted to `Pattern`.
        }
      }
    }

    // #enddocregion subtype-variable
  }

  {
    // #docregion subtype-redundant
    void f(Object o) {
      if (o is Comparable /* (1) */ ) {
        if (o is Pattern /* (2) */ ) {
          print((o as Pattern).matchAsPrefix('foo')); // (3) OK
        }
      }
    }

    // #enddocregion subtype-redundant
  }

  {
    // #docregion subtype-string
    void f(Object o) {
      if (o is Comparable /* (1) */ ) {
        if (o is String /* (2) */ ) {
          print(o.matchAsPrefix('foo')); // (3) OK
        }
      }
    }

    // #enddocregion subtype-string
  }

  {
    // #docregion local-write-capture-reorder
    void f(int? i, int? j) {
      if (i == null) return; // (1)
      // ... Additional code ...
      print(i.isEven); // (2) OK
      var foo = () {
        i = j;
      };
      // ... Use foo ...
    }

    // #enddocregion local-write-capture-reorder
  }

  {
    // #docregion local-write-capture-copy
    void f(int? i, int? j) {
      var foo = () {
        i = j;
      };
      // ... Use foo ...
      var i2 = i;
      if (i2 == null) return; // (1)
      // ... Additional code ...
      print(i2.isEven); // (2) OK because `i2` isn't write captured.
    }

    // #enddocregion local-write-capture-copy
  }

  {
    // #docregion local-write-capture-bang
    void f(int? i, int? j) {
      var foo = () {
        i = j;
      };
      // ... Use foo ...
      if (i == null) return; // (1)
      // ... Additional code ...
      print(i!.isEven); // (2) OK due to `!` check.
    }

    // #enddocregion local-write-capture-bang
  }

  {
    // #docregion closure-new-var
    void f(int? i, int? j) {
      if (i == null) return;
      var i2 = i;
      var foo = () {
        print(i2.isEven); // (1) OK because `i2` isn't changed later.
      };
      i = j; // (2)
    }

    // #enddocregion closure-new-var
  }

  {
    // #docregion closure-new-var2
    void f(int? i) {
      var j = i ?? 0;
      var foo = () {
        print(j.isEven); // OK
      };
    }

    // #enddocregion closure-new-var2
  }

  {
    // #docregion closure-write-capture
    void f(int? i, int? j) {
      var foo = () {
        var i2 = i;
        if (i2 == null) return;
        print(i2.isEven); // OK because i2 is local to this closure.
      };
      var bar = () {
        i = j;
      };
    }

    // #enddocregion closure-write-capture
  }
}

// #docregion this
extension on int? {
  int get valueOrZero {
    final self = this;
    return self == null ? 0 : self;
  }
}
// #enddocregion this

// #docregion private
class PrivateFieldExample {
  final int? _val;
  PrivateFieldExample(this._val);
}

void test(PrivateFieldExample x) {
  if (x._val != null) {
    print(x._val + 1);
  }
}
// #enddocregion private

// #docregion final
class FinalExample {
  final int? _immutablePrivateField;
  FinalExample(this._immutablePrivateField);

  void f() {
    if (_immutablePrivateField != null) {
      int i = _immutablePrivateField; // OK
    }
  }
}
// #enddocregion final

// #docregion not-field
abstract class NotFieldExample {
  int? get _value => Random().nextBool() ? 123 : null;
}

void f(NotFieldExample x) {
  final value = x._value;
  if (value != null) {
    print(value.isEven); // OK
  }
}
// #enddocregion not-field

// #docregion external
class ExternalExample {
  external final int? _externalField;

  void f() {
    final i = _externalField;
    if (i != null) {
      print(i.isEven); // OK
    }
  }
}
// #enddocregion external

// #docregion conflicting-getter
class GetterExample {
  final int? _overridden;
  GetterExample(this._overridden);
}

class Override implements GetterExample {
  @override
  int? get _overridden => Random().nextBool() ? 1 : null;
}

void testParity(GetterExample x) {
  final i = x._overridden;
  if (i != null) {
    print(i.isEven); // OK
  }
}
// #enddocregion conflicting-getter

// #docregion unrelated
class UnrelatedExample {
  final int? _i;
  UnrelatedExample(this._i);
}

class Unrelated {
  int? get _j => Random().nextBool() ? 1 : null;
}

void f2(UnrelatedExample x) {
  if (x._i != null) {
    int i = x._i; // OK
  }
}
// #enddocregion unrelated

// #docregion conflicting-field
class FieldExample {
  final int? _overridden;
  FieldExample(this._overridden);
}

class Override2 implements FieldExample {
  @override
  int? _overridden;
}

void f3(FieldExample x) {
  final i = x._overridden;
  if (i != null) {
    print(i.isEven); // OK
  }
}
// #enddocregion conflicting-field

// #docregion mock
class MockingExample {
  final int? _i;
  MockingExample(this._i);
}

class MockExample extends Mock implements MockingExample {
  @override
  late final int? _i;
}

void f4(MockingExample x) {
  if (x._i != null) {
    int i = x._i; // OK
  }
}

// #enddocregion mock
