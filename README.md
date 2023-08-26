# DrivingLicenseSystem Smart Contract

This Solidity program is a simple smart contract that represents a basic driving license application system. It showcases the use of control flow statements like `require`, and includes a mechanism to manage applicant eligibility for obtaining a driving license.

## Description

This smart contract is written in Solidity, a programming language used for creating smart contracts on the Ethereum blockchain. The contract includes the following functions:

- `applyForLicense`: Allows an eligible individual to apply for a driving license. It verifies the applicant's eligibility based on the minimum age requirement and tracks the number of applications.

- `addEligibleCandidate`: Adds an eligible individual to the list of candidates who can apply for a driving license.

- `removeEligibleCandidate`: Removes an individual from the list of eligible candidates.

## Getting Started

### Prerequisites

To interact with this smart contract, you'll need an Ethereum development environment, such as Remix IDE.

### Execution

To run this program, follow these steps:

1. Open the Remix IDE by visiting https://remix.ethereum.org/.
2. Create a new file in the IDE and save it with a `.sol` extension (e.g., `DrivingLicenseSystem.sol`).

  
 ```
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

```

3. Copy and paste the provided code snippet into the file.
4. Compile the code by selecting the "Solidity Compiler" tab, ensuring the compiler version is set to `0.8.0`, and clicking on "Compile VoterSystem.sol".
5. Deploy the smart contract by switching to the "Deploy & Run Transactions" tab and clicking on "Deploy" (ensure you have the appropriate network selected).
6. Interact with the contract by calling its functions, such as `vote`, `addCandidate`, and `deleteCandidate`.

## Authors

[Rohit Kumar](https://github.com/rk98991439/)

## License

This project is licensed under the MIT License. See the [LICENSE.md](https://license.md/) file for details.


