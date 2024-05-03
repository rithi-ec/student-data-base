// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDatabase {
    struct Student {
        string name;
        uint256 age;
        string major;
    }
    
    mapping(uint256 => Student) public students;
    mapping(uint256 => bool) public studentExists;

    event StudentAdded(uint256 indexed rollNumber, string name, uint256 age, string major);
    event StudentUpdated(uint256 indexed rollNumber, string name, uint256 age, string major);
    
    function addStudent(uint256 _rollNumber, string memory _name, uint256 _age, string memory _major) public {
       
        
        students[_rollNumber] = Student(_name, _age, _major);
        studentExists[_rollNumber] = true;
        emit StudentAdded(_rollNumber, _name, _age, _major);
    }
    
    function updateStudent(uint256 _rollNumber, string memory _name, uint256 _age, string memory _major) public {
       
        
        students[_rollNumber] = Student(_name, _age, _major);
        emit StudentUpdated(_rollNumber, _name, _age, _major);
    }
    
    function getStudentDetails(uint256 _rollNumber) public view returns (string memory, uint256, string memory) {
        
        return (students[_rollNumber].name, students[_rollNumber].age, students[_rollNumber].major);
    }
}