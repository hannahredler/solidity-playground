
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract SmartWallet {

    address payable public owner;
    mapping(address => bool) isAllowed;
    mapping(address => uint) allowances;
    mapping(address => bool) guardians;
    uint public nGuardians;
    
    address nextOwner;
    uint nVotes;
    mapping(address => address) guardianVotes;
    uint confirmationForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    fallback() external payable {}

    function sendFunds(address payable _to, uint _amount, bytes memory _payload) external returns(bytes memory) {
        require(isAuthenticated() || hasEnoughAllowance(_amount)) ;
        require(address(this).balance >= _amount, "Not enough balance!");
        (bool isSuccessful, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(isSuccessful, "Transfer was not successful");
        return returnData;
    }

    function addGuardian(address _newGuardian) public  {
        if (nGuardians <5) {
            nGuardians++;
            guardians[_newGuardian] = true;
        } else {
            revert("Cannot add another guardian, there are already enough");
        }
    }

    function changeOwner(address _newOwner) public {
        require(guardians[msg.sender], "Not a guardian, cannot change owner");
        if (nextOwner != _newOwner) {
            nextOwner = _newOwner;
            nVotes = 1;
            guardianVotes[msg.sender] = _newOwner;
        } else {
            if (guardianVotes[msg.sender] != _newOwner) {
                nVotes ++;
                guardianVotes[msg.sender] = _newOwner;
            }
            if (nVotes >= confirmationForReset) {
                owner = payable(_newOwner);
                nextOwner = address(0);
                nVotes = 0;
            }
        }
        
    }

    function isAuthenticated() public view returns (bool) {
        return msg.sender == owner;
    }

    function setAllowance(address _user, uint _amount) external {
        bool isOwner = isAuthenticated();
        require(isOwner, "Authentication error");
        allowances[_user] = _amount;
        if (_amount > 0) {
            isAllowed[_user] = true;
        } else {
            isAllowed[_user] = false;
        }
        
    } 

    function hasEnoughAllowance(uint amount) public view returns (bool) {
        require(isAllowed[msg.sender], "This sender is not allowed!");
        return allowances[msg.sender] >= amount;
    }
}