pragma solidity ^0.8.10;

contract ViewAndPure {
    uint public x=1;


    // view function promises not to change the state
    function addToX(uint y) public view returns (uint) {
        return x+y;
    }

// pure function promises not to modify or READ the state (passthrough)
    function add(uint i, uint j) public pure returns (uint) {
        return i+j;
    }
}
