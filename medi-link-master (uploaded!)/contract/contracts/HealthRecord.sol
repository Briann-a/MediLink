// SPDX-License-Identifier: MIT
pragma solidity 0.5.1;

contract HealthRecord {
    struct Record {
        // Store patient data as a single string in JSON format
        string jsonData;
        bool isDoctor;
    }

    mapping(address => Record) public records;

    // Event to emit when record is set
    event RecordSet(address indexed user, string jsonData, bool isSick);

    function setRecord(address _user, string memory _jsonData, bool _isDoctor) public {
        require(bytes(_jsonData).length > 0, "Data cannot be empty");
        records[_user] = Record(_jsonData, _isDoctor);
        emit RecordSet(_user, _jsonData, _isDoctor); // Emit an event when a record is set
    }

    function getRecord(address _user) public view returns (string memory, bool) {
        require(bytes(records[_user].jsonData).length > 0, "Record does not exist");
        return (records[_user].jsonData, records[_user].isDoctor);
    }
}