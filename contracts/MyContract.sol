// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract myContract {

    string public ourString = "Hello world";

    function updateOurString(string memory _ourString) public {
        ourString = _ourString;
    }
}