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

## 2. Array Methods

### Method Details & Examples

#### push()
- **Adds** item(s) **to end**.
- Modifies original.

```javascript
let arr = [1, 2];
arr.push(3); // arr = [1, 2, 3]
```

#### pop()
- **Removes** last item.
- Modifies original.

```javascript
let arr = [1, 2, 3];
let last = arr.pop(); // last=3, arr=[1,2]
```

#### unshift()
- **Adds** item(s) **to start**.
- Modifies original.

```javascript
let arr = [2, 3];
arr.unshift(1); // arr=[1,2,3]
```

#### shift()
- **Removes** first item.
- Modifies original.

```javascript
let arr = [1, 2, 3];
let first = arr.shift(); // first=1, arr=[2,3]
```

#### slice(start, end)
- **Copies** part of array (**does NOT modify** original).
- Returns **new array** from `start` to `end-1`.

```javascript
let arr = [0, 1, 2, 3];
let sub = arr.slice(1, 3); // sub=[1,2], arr unchanged
```

#### splice(start, deleteCount, ...items)
- **Adds/Removes/Replaces** element(s) **in-place**.
- **Modifies original**, returns array of removed items.

```javascript
let arr = [1, 2, 3, 4];
let removed = arr.splice(1, 2, 'a', 'b'); 
// removed=[2,3], arr=[1,'a','b',4]
```

#### forEach(callback)
- Runs function for **each element**. 
- **Does NOT return new array** or alter original.

```javascript
let sum = 0;
[1,2,3].forEach(num => sum += num); // sum=6
```

#### find(callback)
- Returns **first element** that matches test, else `undefined`.
- Does **not modify** array.

```javascript
let arr = [3, 7, 10];
let found = arr.find(x => x > 5); // 7
```

#### some(callback)
- Returns **true** if ANY element passes test.
- Does not modify original.

```javascript
let arr = [1, 3, 5];
let hasEven = arr.some(x => x%2 === 0); // false
```

#### every(callback)
- Returns **true** only if ALL items pass test.
- Does not modify original.

```javascript
let arr = [2, 4, 6];
let allEven = arr.every(x => x%2 === 0); // true
```

### Overview Table

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


