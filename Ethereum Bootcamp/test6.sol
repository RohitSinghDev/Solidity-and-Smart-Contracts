// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Main1{

    address public owner;

    event TokenSent(address _from, address _to, uint _amount);

    constructor(){
        owner = msg.sender;
        tokenBalance[owner] = 100;

    }

    mapping(address => uint) public tokenBalance;



    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokenSent(msg.sender,_to,_amount);

        return true;
    }
    // when deployed on js vm the decoded output is true but 
    // deploying on real blockchain does not give any output
    // when we use event, we get logs about the transaction



}