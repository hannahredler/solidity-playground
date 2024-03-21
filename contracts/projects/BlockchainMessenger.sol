// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract BlockchainMessenger {

    string public myString;
    address public owner;
    uint public nUpdates;

    constructor() {
        owner = msg.sender;
    }

    function setMyString(string memory _myString) public {
        if (msg.sender == owner) {
            myString = _myString;
            nUpdates ++;
        }
    }

}