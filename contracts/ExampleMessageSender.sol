// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleMessageSender {

    address public someAddress;

    function setSomeAddress() public {
        someAddress = msg.sender;
    }
}