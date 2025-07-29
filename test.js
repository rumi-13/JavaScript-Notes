let prices = { apples: 100, bananas: 60, oranges: 80 };


let vals = Object.values(prices)

let res= vals.reduce((acc, val)=>{return acc+val},0)

console.log(res);
