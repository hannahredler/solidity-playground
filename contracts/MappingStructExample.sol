// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract MappingStructExample {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function getDepositNum(address _account, uint _depositNum) public view returns(Transaction memory) {
        return balances[_account].deposits[_depositNum];
    }

    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = Transaction(msg.value, block.timestamp);
        balances[msg.sender].numDeposits++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = Transaction(_amount, block.timestamp);
        balances[msg.sender].numWithdrawals++;
        _to.transfer(_amount);
    } 

}