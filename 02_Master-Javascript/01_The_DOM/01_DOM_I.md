
# JavaScript: DOM Manipulation

The Document Object Model (DOM) is a programming interface for web documents. It represents the page as a tree of objects, allowing JavaScript to read and change the document's structure, style, and content.

> **Mindset:** Think of the DOM as the "brain" of your webpage. Every change you make with JavaScript directly alters what the user sees and interacts with. Use this power responsibly to create dynamic and responsive experiences.

## 1. DOM Tree Structure

The DOM represents an HTML document as a tree of **nodes**. Everything in an HTML document is a node.

*   **Element Node**: Any HTML tag, like ``, ``, ``, or ``.
*   **Text Node**: The actual text content inside an element.
*   **Comment Node**: An HTML comment ``.

Consider this HTML:

```html

  My Title
  

```

Its DOM tree looks like this:

*   `` (Element)
    *   `` (Element)
        *   `"My Title"` (Text)
    *   `` (Comment)

## 2. Selecting Elements

To manipulate an element, you first need to select it.

| Method                    | Description                                                   | Returns                        |
| ------------------------- | ------------------------------------------------------------- | ------------------------------ |
| `getElementById()`        | Selects a single element by its unique `id`.                  | A single Element object or `null`  |
| `getElementsByClassName()`| Selects all elements that have a given `class` name.          | A live `HTMLCollection`        |
| `querySelector()`         | Selects the **first** element that matches a CSS selector.    | A single Element object or `null`  |
| `querySelectorAll()`      | Selects **all** elements that match a CSS selector.           | A static `NodeList`            |

```html


    DOM Intro
    A paragraph.

```

```javascript
// Get a single element by its ID
const container = document.getElementById('container');

// Get a collection of elements by class
const headings = document.getElementsByClassName('heading'); // Returns an HTMLCollection

// Get the first element matching a CSS selector
const firstHeading = document.querySelector('.heading'); // Returns the h1

// Get all elements matching a CSS selector
const allHeadings = document.querySelectorAll('.heading'); // Returns a NodeList
```

### ▲ Confusion: `HTMLCollection` vs. `NodeList`

This is a key difference between the older `getElementsBy` methods and the modern `querySelectorAll`.

*   **`HTMLCollection`** (returned by `getElementsByClassName`, `getElementsByTagName`)
    *   **Live**: It automatically updates if you add or remove elements from the DOM that match the selector.
    *   Contains only element nodes.

*   **`NodeList`** (returned by `querySelectorAll`)
    *   **Static**: It's a snapshot. It will **not** update if you change the DOM later.
    *   Can contain any node type (elements, text, comments).

**Example of "Live" vs. "Static":**

```html

  Item 1
  Item 2

```

```javascript
const parentDiv = document.getElementById('parent');

// Live HTMLCollection
const liveCollection = parentDiv.getElementsByClassName('item');

// Static NodeList
const staticList = parentDiv.querySelectorAll('.item');

console.log('Before change:');
console.log('Live Collection length:', liveCollection.length); // 2
console.log('Static List length:', staticList.length);     // 2

// Add a new element that matches the selector
const newItem = document.createElement('p');
newItem.className = 'item';
newItem.textContent = 'Item 3';
parentDiv.appendChild(newItem);

console.log('After change:');
console.log('Live Collection length:', liveCollection.length); // 3 (updated!)
console.log('Static List length:', staticList.length);     // 2 (did not update)
```

## 3. Accessing & Modifying Content

Once you've selected an element, you can read or change its content.

### ▲ Confusion: `innerText` vs. `textContent` vs. `innerHTML`

| Property      | Description                                                                                             | Use Case                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `innerHTML`   | Gets or sets all content, **including HTML tags**.                                                      | When you need to set content with HTML structure.           |
| `textContent` | Gets or sets all text content, including from `` & `` tags. Ignores CSS styling.         | Raw text access. Faster and safer than `innerHTML`.         |
| `innerText`   | Gets or sets only the **visible** text content. It is aware of CSS styling (e.g., `display: none`).     | Getting text as a user would see it. Performance-heavy.     |

> **Security Warning**: Avoid setting `innerHTML` with user-provided content. It can lead to Cross-Site Scripting (XSS) attacks. Use `textContent` whenever you are only dealing with text.

**Example:**

```html

  Hello World!
  Hidden Text

```

```javascript
const box = document.getElementById('content-box');

// innerHTML includes the  tag
console.log(box.innerHTML);   // "Hello World! Hidden Text"

// textContent gets all raw text, ignoring styles and tags
console.log(box.textContent); // "Hello World! Hidden Text"

// innerText gets only visible text, respecting styles
console.log(box.innerText);   // "Hello World!"

// Example of setting content
box.textContent = "You have been updated!";
```

## 4. Attribute Manipulation

You can easily get, set, or remove HTML attributes like `href`, `src`, `class`, or `disabled`.

*   `getAttribute('attributeName')`: Returns the value of an attribute.
*   `setAttribute('attributeName', 'value')`: Creates or changes an attribute.
*   `removeAttribute('attributeName')`: Removes an attribute.

```html
My Link
```

```javascript
const link = document.getElementById('my-link');

// Get an attribute
const oldHref = link.getAttribute('href'); // "/old-path"

// Set an attribute
link.setAttribute('href', '/new-path');
link.setAttribute('target', '_blank'); // Add a new attribute

// Remove an attribute
link.removeAttribute('target');
```

## 5. Creating & Removing Elements

You can dynamically create new elements and add them to the DOM.

*   `document.createElement('tagName')`: Creates a new element.
*   `parentElement.appendChild(childElement)`: Adds an element as the **last** child of a parent.
*   `parentElement.prepend(childElement)`: Adds an element as the **first** child of a parent.
*   `parentElement.removeChild(childElement)`: Removes a child element from its parent.

```javascript
// 1. Select the parent where we'll add the new element
const list = document.querySelector('ul');

// 2. Create a new element
const newLi = document.createElement('li');
newLi.textContent = 'New Item';

// 3. Add it to the DOM
list.appendChild(newLi); // Adds to the end of the list

// Create and add another element to the beginning
const firstLi = document.createElement('li');
firstLi.textContent = 'First Item';
list.prepend(firstLi);

// 4. To remove an element, you need its parent and the element itself
// Let's remove the 'New Item' we just added
list.removeChild(newLi);
```

## 6. Styling Elements

While you can style elements directly, the best practice is to toggle CSS classes.

### Method 1: The `style` Property (for quick, specific changes)

You can set inline styles directly on an element's `style` object. CSS properties with hyphens (`background-color`) become camelCase (`backgroundColor`).

```javascript
const title = document.querySelector('h1');

title.style.color = 'blue';
title.style.backgroundColor = '#eee'; // Note the camelCase
title.style.padding = '10px';
```

### Method 2: The `classList` Property (Recommended)

This is the preferred way. You define styles in your CSS file and use JavaScript to add, remove, or toggle classes on elements.

*   `element.classList.add('className')`
*   `element.classList.remove('className')`
*   `element.classList.toggle('className')` (Adds the class if it's not there, removes it if it is)

```css
/* style.css */
.highlight {
  background-color: yellow;
  border: 2px solid red;
  font-weight: bold;
}
```

```javascript
// a button in your HTML: Toggle Highlight
const title = document.querySelector('h1');
const button = document.getElementById('highlighter');

button.addEventListener('click', () => {
  // Add/remove the 'highlight' class on the title each time the button is clicked
  title.classList.toggle('highlight');
});
```