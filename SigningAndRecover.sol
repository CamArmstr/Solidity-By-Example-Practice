pragma solidity ^0.8.10;

// pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";


contract HashTest {
    constructor() {
    uint nonce = 0;
    address to = 0x3AFA32FDbbe2eF9118Cdf020ae972880C00Fd61E;
    uint value = 100;
    // bytes storage data = "hello world";
    }


// Gets hash of arbitrary string 
    function getHash(string memory str) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(str));
    }


// NEED TO SIGN HASH WITH PRIVATE KEY OFF CHAIN SOMEWHERE LIKE METAMASK ETC

// Creates hash of concatenated message with prefix "\x19Ethereum..." with message hash by convention
    function getEthSignedHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }


// Calls ecrecover and compares to signed message hash to identify/verify original address
    function verify(bytes32 _ethSignedMessageHash, bytes memory _signature) public pure returns (address) {
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(_signature);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }


// This splits the public signature into the separate parts needed to recover
    function splitSignature(bytes memory sig) public pure returns (bytes32, bytes32, uint8) {
       require(sig.length == 65);

       bytes32 r;
       bytes32 s;
       uint8 v;

       assembly {
           // first 32 bytes, after the length prefix
           r := mload(add(sig, 32))
           // second 32 bytes
           s := mload(add(sig, 64))
           // final byte (first byte of the next 32 bytes)
           v := byte(0, mload(add(sig, 96)))
       }

       return (r, s, v);
   }

//   function doTheThing(sig) public returns (bool success) {
//     bytes32 _hash =  getTransactionHash(nonce, to, value, data);
//     nonce++;

//   }

//   function getTransactionHash( uint256 _nonce, address to, uint256 value, bytes memory data ) public view returns (bytes32) {
//     return keccak256(abi.encodePacked(address(this), chainId, _nonce, to, value, data));
//   }

//   function recover(bytes32 _hash, bytes memory _signature) public pure returns (address) {
//     return _hash.toEthSignedMessageHash().recover(_signature);
//   }

}