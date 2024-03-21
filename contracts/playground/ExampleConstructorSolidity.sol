// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleConstructorSolidity {

    address public myAddress;

    constructor(address _someAddress) {
        myAddress = _someAddress;
    }

    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function setMyAddressToMessageSender() public {
        myAddress = msg.sender;
    }

}