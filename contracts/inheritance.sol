pragma solidity ^0.8.10;


/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/


contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// contracts inherit other contracts by using "is"

contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called with multiple definitions - 
// parent contracts are searched right to left, depth first

contract D is B, C {
    // D.foo() returns "C" because it is right most and deepest
    function foo() public pure override(B,C) returns (string memory) {
        return super.foo();
    }
}

contract E is C,B {
    // E.foo() returns "B"
    function foo() public pure override(C,B) returns (string memory) {
        return super.foo();
    }
}

contract F is A,B {
    // Can't switch A and B because it needs to be in basest to most derived order
    function foo() public pure override(A,B) returns (string memory) {
        return super.foo();
    }
}