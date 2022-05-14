pragma solidity ^0.8.10;

import "./foo.sol";

import {Unauthorized, add as func, Point} from "./foo.sol";

contract Import {
    Foo public foo = new Foo();

    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}