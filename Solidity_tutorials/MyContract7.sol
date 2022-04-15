// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Test1{
    uint[] public myArray;
    // contructors does not have to be public after 0.7

    constructor(){
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);
        

    }

    function getArray() public view returns(uint[] memory){
        // for returning array type, we need to write memory after it
        return myArray;
    }
}