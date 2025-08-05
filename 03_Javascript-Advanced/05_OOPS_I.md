

# Object-Oriented JavaScript (OOP)

## 1. What is OOP?

**Object-Oriented Programming (OOP)** is a programming style based on the concept of "objects". Instead of writing long, procedural code, OOP allows you to bundle related data (properties) and functions (methods) together into a single "object".

Think of it as creating a blueprint for an object. For example, a `Car` blueprint would define properties like `color` and `model`, and methods like `start()` and `drive()`. From this single blueprint, you can create many individual car objects, each with its own unique properties but sharing the same core behaviors.

# 2. Constructor Functions

A **constructor function** is a special function that acts as a blueprint for creating objects. By convention, their names start with a capital letter. Inside a constructor, the `this` keyword refers to the new object being created.

The `new` keyword is crucial. When you call a constructor with `new`, it does four things:
1.  Creates a new, empty JavaScript object `{}`.
2.  Sets the `this` keyword to point to this new object.
3.  Executes the code inside the constructor function, adding properties and methods to the `this` object.
4.  Returns the `this` object automatically.

**Example: `CreatePencil`**

Here’s a constructor function to create pencil objects.

```javascript
// Constructor Function
function CreatePencil(name, price, color, company) {
  this.name = name;
  this.price = price;
  this.color = color;
  this.company = company;

  this.write = function(text) {
    const heading = document.createElement('h1');
    heading.innerText = text;
    document.body.append(heading);
  };
}

// Creating new pencils using the constructor
const pencil1 = new CreatePencil('Apsara', 5, 'Black', 'Apsara Co.');
const pencil2 = new CreatePencil('Natraj', 4, 'Red', 'Natraj Co.');

console.log(pencil1); // {name: 'Apsara', price: 5, color: 'Black', company: 'Apsara Co.', write: ƒ}
console.log(pencil2); // {name: 'Natraj', price: 4, 'Red', company: 'Natraj Co.', write: ƒ}

// Using the method
pencil1.write('Hello from Apsara!');
```

# 3. What are Prototypes?

In the example above, every pencil object (`pencil1`, `pencil2`, etc.) gets its own copy of the `company` property and the `write` function. This is inefficient and uses unnecessary memory, especially if thousands of pencils are created.

**Prototypes** solve this problem. Every JavaScript object has a private property called `[[Prototype]]` which is a link to another object. This "other object" is called the prototype. When you try to access a property on an object, and the property isn't found, JavaScript automatically looks for it on the object's prototype.

By adding shared properties and methods to the constructor's prototype, you ensure that all objects created by that constructor share the **same** instance of those properties and methods, saving memory.

**Example: Using Prototypes**

Let's refactor our `CreatePencil` constructor to move the shared `company` and `write` method to the prototype.

```javascript
// Constructor Function
function CreatePencil(name, price, color) {
  this.name = name;
  this.price = price;
  this.color = color;
}

// Adding shared properties and methods to the prototype
CreatePencil.prototype.company = 'Hindustan Pencils'; // All pencils share this company

CreatePencil.prototype.write = function(text) {
  const heading = document.createElement('h1');
  heading.innerText = text;
  document.body.append(heading);
};

// Creating new pencils
const pencil1 = new CreatePencil('Apsara', 5, 'Black');
const pencil2 = new CreatePencil('Natraj', 4, 'Red');

console.log(pencil1); // {name: 'Apsara', price: 5, color: 'Black'}
console.log(pencil2); // {name: 'Natraj', price: 4, color: 'Red'}

// Even though 'company' and 'write' aren't in the object, we can access them via the prototype
console.log(pencil1.company); // 'Hindustan Pencils'
pencil2.write('Hello from Prototype!');
```

Now, `pencil1` and `pencil2` don't store their own copies of `company` or `write()`. They access the single, shared versions from `CreatePencil.prototype`, making the code more efficient and memory-friendly.