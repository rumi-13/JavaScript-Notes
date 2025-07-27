let student = {
  name: "Tom",
  age: 22,
  isEnrolled: true,
  address:{
    city: "sxr",
    pin: 192001
  }
}

let copyObj = JSON.parse(JSON.stringify(student))
copyObj.address.pin = 193002
console.log(student);
