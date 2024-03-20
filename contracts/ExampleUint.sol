// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleUint {

    uint public myUint; // 2^256 - 1
    uint8 public myUint8 = 2**4;
    int public myInt = -20; // 

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementMyUint8() public {
        myUint8++;
    }

    function decrementMyUint8() public {
        myUint8--;
    }

    function incrementInt() public {
        myInt++;
    }
}