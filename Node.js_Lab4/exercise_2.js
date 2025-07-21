const fs = require('fs');

// Creating files and adding contents
fs.writeFileSync('file1.txt', 'Hey there!');
fs.writeFileSync('file2.txt', 'Welcome to Node.js.');

// Reading the data in files and storing them in two different variables
const data1 = fs.readFileSync('file1.txt', 'utf8');
const data2 = fs.readFileSync('file2.txt', 'utf8');

// In this step merge operation done successfully 
fs.writeFileSync('merged.txt', data1 + '\n' + data2);

console.log("Files merged successfully");
