// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleAddress {

    address public myAddress;

    function setSomeAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function getBalance() public view returns (uint) {
        return myAddress.balance;
    }


}