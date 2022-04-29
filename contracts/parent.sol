pragma solidity ^0.8.10;

contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo");
    }

    function bar() public virtual {
        emit Log("A.bar");
    }
}

contract B is A {


    function foo() public virtual override {
        emit Log("B.foo");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {
    // Try:
    // - Call D.foo and check the transaction logs.
    //   Although D inherits A, B and C, it only called C and then A.
    // - Call D.bar and check the transaction logs
    //   D called C, then B, and finally A.
    //   Although super was called twice (by B and C) it only called A once.

    function foo() public override(B, C) {
        super.foo();
    }

    function bar() public override(B, C) {
        super.bar();
    }
}
