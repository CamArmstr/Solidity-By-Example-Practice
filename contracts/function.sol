pragma solidity ^0.8.10;

contract Function {
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);

    }

    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }


    // use destructuring assignment when calling another function that returns multiple values
    function destructuringAssignments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        // Values can be left out
        (uint x, , uint y) = (4,5,6);

        return (i,b,j,x,y);
    }

    // Can't use mapping for either input or output (needs to get assigned within a function)
    // But CAN use an array for input and output

    function arrayInput(uint[] memory _arr) public {}

    uint[] public arr;

    function arrayOutput() public view returns(uint[] memory) {
        return arr;
    }


}