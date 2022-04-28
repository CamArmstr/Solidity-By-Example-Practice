pragma solidity ^0.8.10;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}



// You can't override state variables with inherted contracts by declaring it in the child.
// You have to override by declaring in the constructor.
contract C is A {
    constructor () {
        name = "Contract C";
    }
}


// THIS MEANS THE FOLLOWING WILL NOT COMPILE
// contract B is A {
//     string public name = "Contract C";
// }