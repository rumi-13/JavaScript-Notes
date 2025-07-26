# JavaScript Study Notes: Arrays & Key Methods

## 1. Arrays: Creating & Accessing

### What is an Array?
- An **array** is a list-like object to store multiple values in a single variable.
- Elements stored in **ordered, zero-based indexes**.

### Creating Arrays

```javascript
// Using array literal (preferred)
let fruits = ['apple', 'banana', 'cherry'];

// Using Array constructor
let numbers = new Array(1, 2, 3, 4);

// Empty array
let empty = [];
```

### Accessing Elements

```javascript
let arr = ['dog', 'cat', 'bird'];
console.log(arr[0]); // 'dog'
console.log(arr[2]); // 'bird'
console.log(arr[arr.length - 1]); // last element
```

- **Access by index** (first is 0).
- **`arr.length`** gives total items.

# Array Methods

### Method Details & Examples

# push()
- **Adds** item(s) **to end**.
- Modifies original.

```javascript
let arr = [1, 2];
arr.push(3); // arr = [1, 2, 3]
```

# pop()
- **Removes** last item.
- Modifies original.

```javascript
let arr = [1, 2, 3];
let last = arr.pop(); // last=3, arr=[1,2]
```

# unshift()
- **Adds** item(s) **to start**.
- Modifies original.

```javascript
let arr = [2, 3];
arr.unshift(1); // arr=[1,2,3]
```

# shift()
- **Removes** first item.
- Modifies original.

```javascript
let arr = [1, 2, 3];
let first = arr.shift(); // first=1, arr=[2,3]
```

# slice(start, end)
- **Copies** part of array (**does NOT modify** original).
- Returns **new array** from `start` to `end-1`.

```javascript
let arr = [0, 1, 2, 3];
let sub = arr.slice(1, 3); // sub=[1,2], arr unchanged
```

# splice(start, deleteCount, ...items)
- **Adds/Removes/Replaces** element(s) **in-place**.
- **Modifies original**, returns array of removed items.

```javascript
let arr = [1, 2, 3, 4];
let removed = arr.splice(1, 2, 'a', 'b'); 
// removed=[2,3], arr=[1,'a','b',4]
```

# sort
The sort() method in JavaScript is used to sort the elements of an array. By default, it converts each element to a string and compares them based on their Unicode values. This means when sorting numbers without a compare function, the result may not be correct. For example:

``` js
const nums = [100, 2, 20];
nums.sort();
console.log(nums);  // Output: [100, 2, 20] (Wrong order)

```

To sort numbers correctly, a compare function should be used. This function takes two elements and subtracts one from the other:

```js
const nums = [100, 2, 20];
nums.sort((a, b) => a - b);  // Ascending order
console.log(nums);  // Output: [2, 20, 100]
```

For descending order, simply reverse the subtraction:

```js
nums.sort((a, b) => b - a);  // Descending order
console.log(nums);  // Output: [100, 20, 2]
```

The `sort()` method can also be used to sort strings alphabetically. If you have an array of strings:

```js
const fruits = ['banana', 'apple', 'cherry'];
fruits.sort();
console.log(fruits);  // Output: ['apple', 'banana', 'cherry']
```

When sorting arrays of objects, you can specify a property to sort by. For example, sorting users by age:

```js
const users = [
  { name: 'Alice', age: 30 },
  { name: 'Bob', age: 25 }
];

users.sort((a, b) => a.age - b.age);
console.log(users);  
// Output: [{ name: 'Bob', age: 25 }, { name: 'Alice', age: 30 }]
```

It's important to remember that the `sort()` method modifies the **original array** rather than returning a new one. Always use a compare function when sorting numbers or objects to avoid unexpected results.

---
# forEach(callback)
- Runs function for **each element**. 
- **Does NOT return new array** or alter original.

```javascript
let sum = 0;
[1,2,3].forEach(num => sum += num); // sum=6
```

# find(callback)
- Returns **first element** that matches test, else `undefined`.
- Does **not modify** array.

```javascript
let arr = [3, 7, 10];
let found = arr.find(x => x > 5); // 7
```

# some(callback)
- Returns **true** if ANY element passes test.
- Does not modify original.

```javascript
let arr = [1, 3, 5];
let hasEven = arr.some(x => x%2 === 0); // false
```

# every(callback)
- Returns **true** only if ALL items pass test.
- Does not modify original.

```javascript
let arr = [2, 4, 6];
let allEven = arr.every(x => x%2 === 0); // true
```

# Overview Table

| Method      | Modifies Original? | Returns     | Purpose                                  |
|-------------|--------------------|-------------|------------------------------------------|
| push        | Yes                | New length  | Add to end                               |
| pop         | Yes                | Removed val | Remove from end                          |
| unshift     | Yes                | New length  | Add to start                             |
| shift       | Yes                | Removed val | Remove from start                        |
| slice       | No                 | New array   | Copy section                             |
| splice      | Yes                | Removed val(s)| Add/Remove at any position             |
| forEach     | No                 | undefined   | Run function for each item               |
| find        | No                 | Item/undef  | First match (by test function)           |
| some        | No                 | Boolean     | Any items pass test?                     |
| every       | No                 | Boolean     | All items pass test?                     |


