const fs = require('fs');
const path = require('path');

// It will create files where data to be stored and copied
const source = path.join(__dirname, 'source.txt');
const destination = path.join(__dirname, 'destination.txt');

// Created content for source file further it will be copied to the destination file
fs.writeFileSync(source, "Hello there, here it is!!");

// Here it checks if the source file exists or not
if (!fs.existsSync(source)) {
  throw new Error('Source file does not exist.');
}

try {
  // This is an extra operation performed to make sure if the content written in the source file is correct or not
  const readData = fs.readFileSync(source, 'utf-8');

  // this function copies or write the data from sourceFile to destinationFile
  fs.writeFileSync(destination, readData);

  console.log("Operation successfully performed!");
} catch (error) {
  console.log("Error occurred while performing task:", error);
}
