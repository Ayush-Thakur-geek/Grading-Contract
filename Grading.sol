// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SchoolGradingSystem {
    struct Student {
        uint256 id;
        string name;
        uint256 grade;
        bool exists;
    }

    mapping(uint256 => Student) private students;
    uint256 private nextId = 1;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function addStudent(string memory _name) public onlyOwner {
        uint256 studentId = nextId;
        students[studentId] = Student(studentId, _name, 0, true);
        nextId++;
    }

    function addGrade(uint256 _id, uint256 _grade) public onlyOwner {
        require(_id > 0 && _id < nextId, "Student ID does not exist");
        Student storage student = students[_id];
        require(student.exists, "Student does not exist");

        if (_grade > 100) {
            revert("Grade cannot be greater than 100");
        }

        student.grade = _grade;
    }

    function getGrade(uint256 _id) public view returns (uint256) {
        require(_id > 0 && _id < nextId, "Student ID does not exist");
        Student storage student = students[_id];
        assert(student.exists);
        
        return student.grade;
    }
}
