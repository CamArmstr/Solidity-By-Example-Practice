//SPDX Indentifier: MIT
pragma solidity ^0.8.10;

contract EtherUnits {
    uint public oneWei = 1 wei;
    // 1 wei = 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    //1 ether is 10^18 wei
    bool public isOneEther = 1 ether == 1e18;


}