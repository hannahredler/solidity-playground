// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) public myUintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddress() public {
        myAddressMapping[msg.sender] = true;
    }

    function setMyUintUintBoolMapping(uint key1, uint key2, bool _value) public {
        myUintUintBoolMapping[key1][key2] = _value;
    }
}