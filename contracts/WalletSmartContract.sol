
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract WalletSmartContract {

    uint public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAll() public payable {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public payable {
        to.transfer(getContractBalance());
    }
}