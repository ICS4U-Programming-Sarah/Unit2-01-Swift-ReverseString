// This program reads information from line, 
// it uses recursion to reserve a string.

//
//  Created by Sarah Andrew

//  Created on 2023-03-04

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string into lines, ensuring reading empty line.
    let inputLines = inputString.components(separatedBy: .newlines)
    
    // Usage of loop to access each element.
    for str in inputLines {
        // Call function.
        let reversed = reverse(someStr: str)

        // Display to user & write to console.
        print(reversed)
        
        let data1 = Data((reversed + "\n").utf8)
        output.write(data1)
    }

    // Display results to user.
    print("The original strings are: ", inputLines)

    // Declare variable
    var reversedString = ""

    // Write to output file.
    reversedString = reversedString + "The original strings are: \(inputLines)\n"
    let data2 = Data(reversedString.utf8)
    output.write(data2)

    // Close input & output file.
    input.closeFile()
    output.closeFile()

}
// This function uses recursion to
// reverse a set of strings.
func reverse(someStr: String) -> String {
    // Checking to see if the line is empty.
    if someStr.isEmpty {
        // Return value to main
        return someStr
    } else {
        // Return the 1st character to the end,
        // & return the 0th character.
        // It then calls the function
        // recursively.
        return reverse(someStr: String(someStr.dropFirst()))
            + String(someStr.first!)
    }
}
