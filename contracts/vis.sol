pragma solidity ^0.8.10;

contract Base {
    function testPrivateFunc() private pure returns (string memory) {
        return "private called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    function internalFunc() internal pure returns (string memory) {
        return "internal func"
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    function publicfunc() public pure returns (string memory) {
        return "public func";
    }

    function externalFunc() external pure returns (string memory) {
        return "external function";
    }

    string private privateVar = "private";
    string internal internalVar = "internal";
    string public publicVar = "public";

    contract Child is Base {
        function testInternalFunc() public pure override returns (string memory) {
            return internalFunc();
        }
    }










}
