pragma solidity ^0.8.10;

contract Payable {
    address payable owner;

    // payable constructor can receive ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function notPayable() public {}

    function withdraw() public {
        uint amount = address(this).balance;
        
        (bool success,) = owner.call{value:amount}("");
        require(success, "Failed to send");  

    }

    function transfer(address payable _to, uint _amount) public {
        (bool success,) = _to.call{value: _amount}("");
        require(success,"failed");
    }

}