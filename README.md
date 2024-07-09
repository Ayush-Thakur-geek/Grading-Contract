# Grading-Contract

This is a Solidity smart contract for a simple school grading system. The contract allows an owner to add students, assign grades to them, and retrieve their grades. It uses `require()`, `assert()`, and `revert()` statements to ensure the correctness and security of the operations.

## Prerequisites

- Solidity ^0.8.24
- A development environment such as Remix or HardHat

## Contract Description

### Structs

- `Student`: A struct representing a student with the following properties:
  - `id`: The ID of the student.
  - `name`: The name of the student.
  - `grade`: The grade of the student.
  - `exists`: A boolean indicating whether the student exists.

### State Variables

- `students`: A mapping from student IDs to `Student` structs.
- `nextId`: A counter for the next student ID to be assigned.
- `owner`: The address of the contract owner.

### Modifiers

- `onlyOwner`: Ensures that only the owner can call the modified function.

### Functions

- `constructor()`: Sets the contract deployer as the owner.
- `addStudent(string memory _name)`: Adds a new student with the given name. Only the owner can call this function.
- `addGrade(uint256 _id, uint256 _grade)`: Assigns a grade to the student with the given ID. Only the owner can call this function. The grade must be between 0 and 100.
- `getGrade(uint256 _id)`: Returns the grade of the student with the given ID.

## Usage

1. **Deploy the Contract**

   Deploy the contract using Remix, HardHat, or any other Solidity development environment.

2. **Add a Student**

   Call the `addStudent` function with the student's name. Only the contract owner can call this function.

   ```solidity
   addStudent("John Doe")
