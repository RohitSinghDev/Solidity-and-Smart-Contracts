// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Main2{
    // array in solidity is a reference type
    address public manager;
    address[] public players;


    constructor(){
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value>0.001 ether);
        players.push(msg.sender);

    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players)));
    }

    function pickWinner()public view returns(uint){
        uint index = random() % players.length;
        return index;
    }
}
