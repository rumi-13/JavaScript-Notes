# 📝 **Event Handling - Revised**

Here are the key concepts you need to review:

## 🎯 **Areas for Improvement**

### **1. event.target vs event.currentTarget**

**Key Difference:**
- **`event.target`** = The element that **actually triggered** the event (what you clicked)
- **`event.currentTarget`** = The element that **has the event listener** attached

**Example:**
```javascript

    Click me


document.getElementById('parent').addEventListener('click', function(e) {
    console.log('target:', e.target.id);        // "child" (button clicked)
    console.log('currentTarget:', e.currentTarget.id); // "parent" (div has listener)
});
```

**Memory Tip:** Target = what triggered, currentTarget = what's listening

### **2. Input Event vs Change Event**

**`input` event:**
- Fires on **every keystroke**
- Real-time updates
- Better for live validation

**`change` event:**
- Fires when element **loses focus** AND value changed
- Less frequent
- Good for final validation

**Example:**
```javascript
// Real-time character counter
input.addEventListener('input', function(e) {
    counter.textContent = e.target.value.length; // Updates as you type
});

// Final validation
input.addEventListener('change', function(e) {
    validateEmail(e.target.value); // Only when user finishes
});
```

### **3. Event Flow Phases**

**Complete Order:**
1. **Capturing Phase** (top → down)
2. **Target Phase** (at the element)  
3. **Bubbling Phase** (bottom → up)

**Visual:**
```
Document
  ↓ (Capture)
 Body
  ↓ (Capture)
 Div
  ↓ (Capture)
Button (Target) ← Event happens here
  ↑ (Bubble)
 Div
  ↑ (Bubble)
 Body
  ↑ (Bubble)
Document
```

### **4. preventDefault() Behavior**

**What it does:**
- **Stops** the browser's default action
- **Does NOT stop** event propagation
- Examples: prevents form submission, link navigation, right-click menu

**Example:**
```javascript
form.addEventListener('submit', function(e) {
    e.preventDefault(); // Stops form from submitting
    console.log('Form blocked'); // This still runs
    // Event still bubbles up to parent elements
});
```

### **5. Keyboard Event Properties**

**Key Properties:**
- **`event.key`** = Human-readable value ("a", "Enter", "Shift")
- **`event.code`** = Physical key code ("KeyA", "Enter", "ShiftLeft")
- **`event.keyCode`** = Numeric code (deprecated)

**Example:**
```javascript
document.addEventListener('keydown', function(e) {
    console.log('Key:', e.key);     // "a"
    console.log('Code:', e.code);   // "KeyA"
    
    if (e.key === 'Enter') {
        // Handle Enter key
    }
});
```

### **6. Event Delegation Benefits**

**Why use it:**
- **Performance**: 1 listener instead of many
- **Dynamic**: Works for elements added later
- **Memory**: Less memory usage

**Example:**
```javascript
// ❌ Bad: Individual listeners
buttons.forEach(btn => {
    btn.addEventListener('click', handleClick); // Many listeners
});

// ✅ Good: Event delegation
container.addEventListener('click', function(e) {
    if (e.target.matches('button')) {
        handleClick(e); // One listener handles all
    }
});
```

### **7. Simulating Events**

**Methods:**
- **`element.click()`** - Simple click simulation
- **`element.dispatchEvent(new Event('click'))`** - Custom events

**Example:**
```javascript
// Simple
button.click();

// Advanced
const customEvent = new CustomEvent('myEvent', {
    detail: { message: 'Hello!' }
});
element.dispatchEvent(customEvent);
```

## 🔄 **Quick Review Questions**


1. If you click a span inside a div with a click listener, what's `event.target`?
2. Which fires more often: `input` or `change` event?
3. What are the 3 phases of event flow?
4. Does `preventDefault()` stop event bubbling?
5. What property gives you the actual key pressed?

**Answers:** span, input, capturing→target→bubbling, no, event.key

## 💡 **Pro Tips**

- Use **event delegation** for dynamic content
- **`input`** for real-time, **`change`** for final validation  
- **Always clean up** event listeners to prevent memory leaks
- Use **`event.target`** to know what was clicked
- **`preventDefault()`** stops default actions, **`stopPropagation()`** stops bubbling
