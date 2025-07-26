# Arrays Advanced concepts
- The methods given below always take a function with a value, indicating the individual items or the array upon which the method is used, upon which they do their work.
## 1. `map()`

- **Creates a new array** by applying a function to every element of the original.
- **Does NOT modify** the original array.
- **When to use?** <br> It is used when we need to create a new array based on previou's arrays database. <br> Whenever you hear *map* think of a blank array where the individual items of previous array are to be retuned one by one.
- In case nothing is returned; ***undefined*** will be returned by default. 
- The Output array is **same length** as input
- **Use-cases:** Transforming data (e.g., squaring numbers, extracting fields from objects, rendering lists in UI frameworks)  

**Syntax:**
```js
1. const newArr = arr.map((element, index) => {
  // return new value
});
2. const newArr = arr.map((element, index, array) => {
  // return new value
});
```

**Example:**
```js
const nums = [1, 2, 3];
const double = nums.map(n => n * 2); // [2, 4, 6]
```

## 2. `filter()`

- **Creates a new array** with only elements that pass a test (returns truthy in callback).
- **Does NOT modify** the original array.
- When True is retruned the current item passes the filter-test and is returned otherwise false is returned indicating that item isn't returned
- **Use-cases:** Search, remove unwanted values, filter objects by property  
- **Edge Case:** Can remove falsy values:  
```js
[0, '', 2, false].filter(Boolean) // [2]
```


**Syntax:**
```js
1. const results = arr.filter((item, index) => {
  // return true to keep, false to remove
});
2. const results = arr.filter((item, index, array) => {
  // return true to keep, false to remove
});
```

**Example:**
```js
const nums = [1, 2, 3, 4];
const evens = nums.filter(n => n % 2 === 0); // [2, 4]
```



## 3. `reduce()`

- **Reduces an array to a single value** (number, string, object, etc).
- Callback runs for each element, passing an accumulator.
- **Use-cases:** Sum, product, building objects, flattening arrays  
- **Edge:** Initial value is important; if not provided, first array element is used!  

**Syntax:**
```js
1. const result = arr.reduce((accumulator, item) => {
  // return new acc value
}, initialValueOfAccumulator);
2. const result = arr.reduce((acc, currenItem, index, array) => {
  // return new acc value
}, initialValue);
```

**Example:**
```js
const nums = [1, 2, 3];
const sum = nums.reduce((total, n) => total + n, 0); // 6
```


```js
[].reduce((acc, n) => acc + n, 0) // 0 (safe)
[].reduce((acc, n) => acc + n) // TypeError!
```


## 4. Destructuring

**Unpacks values** from arrays or properties from objects into variables, for concise code.

### Array Destructuring

```js
const arr = [1, 2, 3];
const [a, b, c] = arr; // a=1, b=2, c=3
```

- Skip elements:
  ```js
  const [, , third] = arr; // third=3
  ```
- Default values:
  ```js
  const [x = 10, y = 20] = [5]; // x=5, y=20
  ```

### Object Destructuring

```js
const user = { name: "Bob", age: 25 };
const { name, age } = user;
```
- Rename:
  ```js
  const { name: userName } = user; // userName="Bob"
  ```
- Default:
  ```js
  const { city = "Delhi" } = user; // city="Delhi"
  ```


## 5. Spread Operator (`...`)

**Expands** iterable elements (array, string, object) into individual elements.

**Array:**
```js
const arr1 = [1, 2];
const arr2 = [...arr1, 3, 4]; // [1, 2, 3, 4]
```

- Clone an array:
  ```js
  const copy = [...arr1];
  ```
- Merge arrays:
  ```js
  const merged = [...arr1, ...arr2];
  ```

**Object:**
```js
const obj1 = { a: 1 };
const obj2 = { ...obj1, b: 2 }; // {a:1, b:2}
```

**Edge:** Last spread wins in case of duplicate keys/properties.  
[6][7]

## 6. Rest Operator (`...`)

**Collects** all remaining elements/properties into an array/object.

**In Function Parameters:**
```js
function sum(...numbers) {
  return numbers.reduce((total, n) => total + n, 0);
}
sum(1, 2, 3); // 6
```

- Always last parameter.
- Only one rest parameter allowed per function.

**In Destructuring:**
```js
const arr = [1, 2, 3, 4];
const [first, ...rest] = arr; // first=1, rest=[2,3,4]

const obj = { a: 1, b: 2, c: 3 };
const { a, ...others } = obj; // a=1, others={b:2, c:3}
```


## Quick Comparison Table

| Feature       | What It Does                    | Modifies Input? | Output           | Syntax Highlights         |
|---------------|---------------------------------|-----------------|------------------|--------------------------|
| map()         | Transforms every element        | No              | New array        | arr.map(cb)              |
| filter()      | Keeps elements passing a test   | No              | New array        | arr.filter(cb)           |
| reduce()      | "Reduces" array to single value | No              | Single value     | arr.reduce(cb, initVal)  |
| destructuring | Unpacks array/object values     | No              | Variables        | [a, b] = arr; {x} = obj; |
| spread        | Spreads elements/properties out | No              | Expanded/merged  | [...arr], {...obj}       |
| rest          | Gathers the rest as array/obj   | No              | Array/object     | ...rest                  |

## Handy Tips & Gotchas

- **`map`, `filter`, `reduce`** never modify the original array.
- **spread** is for expansion; **rest** is for collection.
- Default values & renaming in destructuring help avoid undefined or collisions.
- Always use initial value in `reduce` with possible empty arrays!

