// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrivingLicenseSystem {
    uint public minimumAge = 18; // Minimum age required for a driving license

    // Mapping to track whether an address is eligible to apply for a driving license
    mapping(address => bool) public isEligible;

    // Mapping to store the number of driving license applications received for each individual
    mapping(address => uint) public applicationCounts;

    // Function to determine if an applicant is eligible based on age
    function checkEligibility(uint age) internal pure returns (bool) {
        return age >= 18;
    }

    // Function for an individual to apply for a driving license
    function applyForLicense(uint age) external {
        require(!isEligible[msg.sender], "You are already eligible for a driving license");
        require(checkEligibility(age), "You are not eligible to apply for a driving license");

        isEligible[msg.sender] = true;
        applicationCounts[msg.sender]++;
    }

    // Function to add an individual to the list of eligible candidates
    function addEligibleCandidate(address _applicant) external {
        require(!isEligible[_applicant], "Applicant is already eligible.");
        
        isEligible[_applicant] = true;
    }

    // Function to remove an individual from the list of eligible candidates
    function removeEligibleCandidate(address _applicant) external {
        require(isEligible[_applicant], "Applicant is not eligible.");
        
        isEligible[_applicant] = false;
    }
}
