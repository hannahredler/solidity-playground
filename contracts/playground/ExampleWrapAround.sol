// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleWrapAround {

    uint public myUint; // 2^256 - 1
    uint8 public myUint8 = 0;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint() public {
        myUint++;
    }

    function decrementUint() public {
        unchecked {
            myUint--;
        }
    }

}