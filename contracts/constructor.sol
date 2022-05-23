pragma solidity ^0.8.10;

contract X {
    string public name;
    constructor (string memory _name) {
        name = _name;

    }
}


contract Y {
    string public text;

    constructor (string memory _text) {
        text = _text;
    }
}

// When using other contracts to instantiate a contract, Can pass inputs in via the inheritance list 
// Amazing
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
// Or can pass parameters inthe constructor (this acts like function modifiers)
constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Parent constructors are always called in order of inheritance - regardless of the order of parent contracts in the child contract

contract D is X, Y {
    constructor() X("X call") Y("Y Call") {}
}

contract E is X, Y {
    constructor() Y("Y Call") X("X call") {}
} 