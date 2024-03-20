// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ExampleMapping {

    mapping(address => uint) balanceReceived;
    
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0; // This line must be before the one below for security reasons
       _to.transfer(balanceToSendOut);
       
    }
}