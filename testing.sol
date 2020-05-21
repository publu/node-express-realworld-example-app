pragma solidity ^0.5.0;
contract SimpleBank {
    mapping (address => uint) private balances;

    address public owner;

    constructor() public {
        owner = msg.sender;
    }
    function enroll() public returns (uint){
        address user = msg.sender;
        balances[user] = 0; 
        return user.balance;
    }

   function deposit() public payable returns (uint) {
        address user = msg.sender;

        balances[user] += msg.value;

        return balances[user];
    }

    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        address payable user = msg.sender;
        require(balances[user] >= withdrawAmount);
        balances[user] -= withdrawAmount; 
        user.transfer(withdrawAmount);
        return balances[user];
    }

    function balance() public view returns (uint) {
        address user = msg.sender;
        return balances[user];
    }
}
