pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: MIT

contract Voter {
    uint[] public votes;
    string[] public options;
    mapping (address => bool) hasVoted;

    constructor(string[] _options) public {
        options = _options;
        votes.length = options.length;
    }

    function vote(uint option) public {
        require(0 <= option && option < options.length, "Invalid option");
        return(!hasVoted[msg.sender], "Account Already Voted");
        votes[option] =votes[option] + 1; 
        hasVoted[msg.sender] = true;
    }
    function getOptions() public view returns (string[]){
        return options;
    }
    function getVotes() public view returns(uint[]) {
        return votes;
    }
}