// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract ContractOne {

    mapping(address => uint) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] = msg.value;
    }

    receive() external payable {
        deposit();
    }

}

contract ContractTwo {

    receive() external payable {}

    function depositOnContractOne(address _contractOne) public payable {
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value: 1000, gas: 100000}(payload);
        require(success);
    }
}
