# Export in Directories

### What is a Directory?

A **directory** (also known as a folder) is a location in a computer's file system used to store and organize files and other directories. In Node.js, we use directories to organize our project's code, grouping related files together to make our applications more manageable and maintainable.

-----

## Exporting Data from a Directory

When you want to export data from a directory containing multiple files, you can create a single point of entry using an **`index.js`** file. This file acts as a module aggregator. Instead of having to `require` each file individually, you can require the directory itself, and Node.js will automatically look for and load the `index.js` file inside it.

The process works like this:

1.  **Define exports in each file**: In each file within the directory (e.g., `apple.js`, `banana.js`), you define and export specific data using `module.exports`.
2.  **Create `index.js`**: Create an `index.js` file in the root of the directory.
3.  **Aggregate exports**: In `index.js`, you `require` each individual file and then use `module.exports` to export them all together, usually as a single object.
4.  **Require the directory**: In your main application file, you can then `require` the directory itself. Node.js automatically finds and uses the `index.js` file, giving you access to all the exported data from a single `require` statement.

-----

## Example: The `Fruits` Directory

Let's apply this concept to a `Fruits` directory.

### 1\. Directory Structure

First, set up your files and directories like this:

```
/my-project
├── app.js
└── fruits/
    ├── apple.js
    ├── banana.js
    ├── mango.js
    └── index.js
```

### 2\. Define Exports in Each File

**`fruits/apple.js`**

```javascript
const apple = {
  name: 'Apple',
  color: 'Red'
};

module.exports = apple;
```

**`fruits/banana.js`**

```javascript
const banana = {
  name: 'Banana',
  color: 'Yellow'
};

module.exports = banana;
```

**`fruits/mango.js`**

```javascript
const mango = {
  name: 'Mango',
  color: 'Yellow'
};

module.exports = mango;
```

Each file now exports a single object representing a fruit.

### 3\. Aggregate Exports in `index.js`

Now, let's create the `index.js` file to combine all these exports.

**`fruits/index.js`**

```javascript
const apple = require('./apple');
const banana = require('./banana');
const mango = require('./mango');

// Export all the fruits as a single object
module.exports = {
  apple,
  banana,
  mango
};
```

This file imports each fruit module and then re-exports them all together as a single object.

### 4\. Require and Use the Directory in `app.js`

Finally, in your main application file, you can `require` the entire directory, which will load the `index.js` file and give you access to all the fruits.

**`app.js`**

```javascript
// Require the fruits directory
const fruits = require('./fruits');

console.log(fruits.apple.name);   // Output: Apple
console.log(fruits.banana.color); // Output: Yellow
console.log(fruits.mango);        // Output: { name: 'Mango', color: 'Yellow' }
```

As you can see, the `require('./fruits')` statement makes all the exported fruit data available through a single `fruits` object, making your `app.js` file cleaner and easier to read.