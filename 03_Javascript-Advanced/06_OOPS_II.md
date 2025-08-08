
# 1) ES6 Classes

**ES6 classes** offer a cleaner, more organized way to structure code, bringing a syntax that's familiar to developers from other object-oriented languages. While they look like traditional classes, they are fundamentally **syntactic sugar** over JavaScript's existing **prototype-based inheritance**. This means that when you define a class, you're actually creating a **constructor function** and a **prototype object**. The constructor is the function that's called when you create a new instance with the `new` keyword, and the prototype object holds all the methods that are shared by every instance of the class.

A key difference from traditional function declarations is that **class declarations are not hoisted**. This means you must define a class before you can instantiate it. For example, you can't create a `new Person()` before the `class Person` declaration appears in your code. Also, all class code runs in **strict mode** by default, which helps catch common coding errors and enforces better practices.

```javascript
class Person {
  constructor(name, age) {
    this.name = name;  // own property
    this.age = age;    // own property
  }

  introduce() {        // shared prototype method
    console.log(`Hello, my name is ${this.name} and I am ${this.age} years old.`);
  }
}

const p1 = new Person("Ali", 25);
p1.introduce(); // Hello, my name is Ali and I am 25 years old.
```

-----

# 2\) Constructor and Methods

The **`constructor`** is a special method that's automatically invoked when a new object is created from a class. Its primary role is to initialize the object by setting up its **own properties**, which are unique to that specific instance. Think of it as the setup phase for each new object.

Methods defined directly within the class (like `drive` in the `Car` example) are placed on the class's **prototype object**. This makes them **shared methods**, meaning all instances of the class can access them without each instance having its own copy. This is a huge memory optimization, especially for classes with many methods.

**Static methods**, on the other hand, belong to the class itself, not to the instances. They are called directly on the class (e.g., `Car.compareYears()`) and are useful for utility functions that don't need to access any instance-specific data.

```javascript
class Car {
  constructor(brand, year) {
    this.brand = brand; // own property
    this.year = year;   // own property
  }

  drive() {             // shared method on prototype
    console.log(`${this.brand} is driving.`);
  }

  static compareYears(car1, car2) { // static method
    return car1.year - car2.year;
  }
}

const c1 = new Car("Toyota", 2010);
const c2 = new Car("Honda", 2015);

c1.drive(); // Toyota is driving.
console.log(Car.compareYears(c1, c2)); // -5
```

-----

# 3\) `extends`

The **`extends`** keyword is the primary mechanism for inheritance in ES6 classes. It establishes a **prototype chain**, where the child class's prototype inherits from the parent class's prototype. This creates a chain of delegation, allowing a child class to access methods and properties defined in its parent. For example, when you call `dog1.makeSound()`, JavaScript first checks if `makeSound` exists on the `Dog` instance or its prototype. When it doesn't find it, it moves up the prototype chain to the `Animal` prototype, where it finds and executes the `makeSound` method.

```javascript
class Animal {
  constructor(type) {
    this.type = type;
  }
  makeSound() {
    console.log(`${this.type} makes a sound.`);
  }
}

class Dog extends Animal {
  bark() {
    console.log("Woof!");
  }
}

const dog1 = new Dog("Dog");
dog1.makeSound(); // Dog makes a sound.
dog1.bark();      // Woof!
```

-----

# 4\) `super`

The **`super`** keyword is essential for managing inheritance in constructors and methods. Inside a child class's constructor, `super()` calls the constructor of the parent class. This is a non-negotiable step: you **must call `super()` before you can use the `this` keyword** in the child's constructor. This ensures that the parent class's properties are correctly initialized on the new object.

The `super` keyword can also be used to call methods from the parent class. `super.speak()` allows the child class to invoke the parent's `speak` method, which is a common pattern for adding functionality without completely overwriting the parent's implementation. This allows you to build on existing functionality rather than duplicating it.

```javascript
class Animal {
  constructor(type) {
    this.type = type;
  }
  speak() {
    console.log(`${this.type} makes a sound.`);
  }
}

class Dog extends Animal {
  constructor(name) {
    super("Dog"); // call parent constructor
    this.name = name;
  }
  speak() {
    super.speak(); // call parent method
    console.log(`${this.name} barks.`);
  }
}

const dog1 = new Dog("Rex");
dog1.speak();
// Dog makes a sound.
// Rex barks.
```

-----

# 5\) Prototypal Inheritance vs Classical Inheritance

This distinction is crucial for understanding how JavaScript truly works. **Classical inheritance** (Java, C++) is based on a blueprint model, where classes are templates and objects are instances created from those templates. **Prototypal inheritance**, which is native to JavaScript, is a more direct object-to-object delegation model. An object inherits properties and methods directly from another object, its prototype.

ES6 classes are simply a more elegant syntax for this prototypal model. The `extends` keyword, for example, is a modern way of setting up the prototype chain that was historically done with methods like `Object.create()`. While the syntax looks classical, the underlying mechanism is still prototypal, which means that every object has a prototype from which it inherits.

```javascript
// Prototypal Example:
const animal = {
  speak() {
    console.log(`${this.name} makes a sound.`);
  }
};

const dog = Object.create(animal); // dog inherits from animal
dog.name = "Rex";
dog.speak(); // Rex makes a sound.

// Classical-like Example (using ES6 classes):
class Animal {
  speak() {
    console.log(`${this.name} makes a sound.`);
  }
}

class Dog extends Animal {
  constructor(name) {
    super();
    this.name = name;
  }
}

const d1 = new Dog("Rex");
d1.speak(); // Rex makes a sound.
```

-----

# 6\) Encapsulation with Private Fields (`#`)

**Encapsulation** is a fundamental principle of object-oriented programming that involves bundling data and the methods that operate on that data into a single unit. The goal is to hide an object's internal state from the outside world, preventing it from being accidentally modified.

Before the introduction of **private fields** with the `#` prefix, true encapsulation was difficult to achieve in JavaScript. Developers often relied on conventions (like prefixing a property name with an underscore, e.g., `_balance`) to signal that a property should be treated as private, but this was just a suggestion and not enforced by the language. Private fields, however, provide a truly private way to store data. Any attempt to access a private field from outside the class will result in a **`SyntaxError`**, ensuring that the data is only ever manipulated by the class's own methods.

```javascript
class BankAccount {
  #balance = 0; // private field

  deposit(amount) {
    this.#balance += amount;
  }

  getBalance() {
    return this.#balance;
  }
}

const account = new BankAccount();
account.deposit(100);
console.log(account.getBalance()); // 100
// console.log(account.#balance); // ❌ SyntaxError
```

-----

# 7\) Class Syntax vs Function Prototype Chain / Shared vs Own Properties

At the end of the day, the **`class` syntax** is a powerful abstraction that makes JavaScript feel more like other languages. However, the underlying mechanisms remain the same. The `constructor` is a function, and the methods you define are placed on its `prototype`. This leads to the key distinction between **own properties** and **shared properties**.

**Own properties** are those set with `this` inside the constructor; they are unique to each instance of the class. . **Shared properties** (methods) live on the prototype and are accessible to all instances, saving memory. It's crucial to be mindful of this distinction when dealing with mutable data types like arrays or objects. If you define a mutable property on the prototype, all instances will share a reference to the **same** object, and a change in one instance will affect all others. To prevent this, always initialize mutable data as an own property within the constructor.

```javascript
class Example {
  constructor() {
    this.ownProperty = "I belong to this object only.";
  }
  sharedMethod() {
    console.log("I am shared by all instances.");
  }
}

const e1 = new Example();
const e2 = new Example();

console.log(e1.hasOwnProperty("ownProperty")); // true
console.log(e1.hasOwnProperty("sharedMethod")); // false
console.log(Object.getPrototypeOf(e1).sharedMethod === Object.getPrototypeOf(e2).sharedMethod); // true
```