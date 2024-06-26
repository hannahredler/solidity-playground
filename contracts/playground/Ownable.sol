//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this action.");
        _;
    }
}