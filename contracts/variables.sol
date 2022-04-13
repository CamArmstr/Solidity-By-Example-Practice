//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Variables {
    //state variables are stored on chain
    string public text ="Hello";
    uint public num = 42;

    function doSomething() public {
        //local variables stay within the function
        uint i = 42;
    }

    //globals are called from somewhere else (on chain data)
    uint timestamp = block.timestamp; //current block timestamp (manipulatable)
    address sender = msg.sender; //address of caller
    uint basefee = block.basefee; //current block's base fee
    uint chainID = block.chainid; //current chain id
    address payable coinbase = block.coinbase; //current block miner's address
    uint difficulty = block.difficulty; //current block gaslimit
    uint blockNum = block.number; //current block number
    uint256 gasRemaining = gasleft(); //CHECK THIS OUT
    // bytes calldata = msg.data; //complete calldata for msg
    address x = msg.sender; //sender
    bytes4 signature = msg.sig; //first 4 bytes of message (COLLISION RISK)
    uint value = msg.value; //# of wei sent with message
    uint gasPrice = tx.gasprice; //transaction gas price
    address y = tx.origin; //transaction sender (full call chain)

}