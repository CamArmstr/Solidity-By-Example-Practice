// Can throw errors in three ways
// require - Used to validate inputs and conditions before execution 
// revert - is similar to require
// assert - Used to check for code that should never be false - failing assertion likely means a bug

pragma solidity ^0.8.10;

contract Error {
    function testRequire(uint _i) public pure {
        // require should validate conditions like:
        // inputs
        // conditions before execution
        // return values from calls to other functions
        require(_i > 10, "input is too low, needs to be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // Revert is useful when the condition to check is complex
        // This does the same as above, but in a more flexible way
        if (_i<10) {
            revert("Input must be greater than  10");
        } 
    }

    uint public num;
    function testAssert() public view {
        // Assert should only be used to test for internal errors
        // and to check invariants
        // Here we assert that num is always equal to 0 - sinc eit is impossible to update the value of num
        assert(num == 0);      
    }

    // custom errors can save gas (using revert) <- Create an error then call it (using an object to assign values in the error)

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }


}