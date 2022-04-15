// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

// we cannot transfer nested dynamic arrays from solidity to our
// js code/interface/abi, this bridge for transfering is not made
// strings in solidity are dynamic arrays
// hence we cannot transfer the arrays of strings from solidity
// to js/interface/abi 
// the above was in older versions, but in solidity 0.8.0, this is improved

contract Test1{

    string[] public check;

    constructor(){
        check.push("h1");
    }

    function myArr()public view returns(string[] memory){
        return check;
    }
    
}