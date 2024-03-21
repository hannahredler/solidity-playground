// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SampleUint {

    uint public myUint = 123;

    function updateUint(uint _myUint) public {
        myUint = _myUint;
    }
}