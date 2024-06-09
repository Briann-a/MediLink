// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientRecords {
    // Define a struct to hold detailed patient information
    struct Patient {
        string name;
        string dateOfBirth; // Storing as a string to simplify; consider using a timestamp or specific date type for more complex needs
        string healthCondition;
    }

    // Mapping from patient ID to their records
    mapping(uint => Patient) private patientRecords;

    // Address of the hospital admin or the smart contract deployer
    address public admin;

    constructor() {
        admin = msg.sender; // Set the deployer as admin
    }

    // Modifier to restrict functions to only admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Function to store a patient's detailed record
    function setPatientRecord(uint _patientId, string memory _name, string memory _dateOfBirth, string memory _healthCondition) public onlyAdmin {
        Patient memory newPatient = Patient({
            name: _name,
            dateOfBirth: _dateOfBirth,
            healthCondition: _healthCondition
        });

        patientRecords[_patientId] = newPatient;
    }

    // Function to retrieve a patient's detailed record
    function getPatientRecord(uint _patientId) public view returns (string memory, string memory, string memory) {
        Patient memory patient = patientRecords[_patientId];
        return (patient.name, patient.dateOfBirth, patient.healthCondition);
    }
}
