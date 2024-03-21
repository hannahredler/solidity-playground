// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Sender {

    receive() external payable{}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10); // This will error when it fails
    }

    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10); // this will send a boolean when it fails
        require(isSent, "IT WAS NOT SENT");
    }
}

contract ReceiverNoAction {

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ReceiverAction {

    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

}