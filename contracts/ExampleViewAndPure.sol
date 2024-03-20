// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleViewAndPure {

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    function getAddition(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function setMyStorageVariable(uint _myStorageVariable) public returns(uint) {
        myStorageVariable = _myStorageVariable;
        return _myStorageVariable;
    }
}