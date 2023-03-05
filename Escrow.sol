// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Escrow {
    address agent;
    mapping(address => uint) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent, "Not an agent");
        _;
    }

    constructor()  {
        agent = msg.sender;
    }

    function deposit(address payee) public onlyAgent payable {
        uint amount = msg.value;
        deposits[payee] = deposits[payee] + amount;
    }

    function withdraw(address payable payee) public onlyAgent{
        uint payment = deposits[payee]; 
        deposits[payee] = 0;
        payee.transfer(payment);
    }





}
