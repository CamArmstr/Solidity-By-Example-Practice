pragma solidity ^0.8.10;

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set sender as owner
        owner = msg.sender;

    }

    // Check if sender is owner

    modifier onlyOwner() {
        require(msg.sender == owner,"not owner");
        // Underscore is only used inside function modifier and wherever it is the rest of the code executes there
        _;
    }


    // Modifiers can take inputs

    modifier validAddress(address _addr) {
        require(_addr!=address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before or after a function.

    modifier noReentrancy() {
        require(!locked, "no reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= 1;

        if (i>1) {
            decrement(i -1);
        }
    }
}