// SPDX-License-Identifier: MIT

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

pragma solidity ^0.8.9;

contract LibrariesExample{

    using SafeMath for uint;

    mapping(address => uint) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = 1;
    }

    // function sendToken(address _to, uint _amount)public returns(bool){
    //     unchecked{
    //     tokenBalance[msg.sender]  = tokenBalance[msg.sender].sub(_amount);
    //     tokenBalance[_to]  = tokenBalance[_to].add(_amount);
    //     // sub and add takes 2 arguments, but if we give 1 arg then other arg
    //     // is the variable itself
    //     }
    //     // even after applying unchecked, no rollover of uint

    //     return true;
    // }

    function sendToken(address _to, uint _amount)public returns(bool){
        
        tokenBalance[msg.sender]  = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to]  = tokenBalance[_to].add(_amount);
        // sub and add takes 2 arguments, but if we give 1 arg then other arg
        // is the variable itself

        // no rollover
        

        return true;
    }


    // function sendToken(address _to, uint _amount)public returns(bool){
    //     unchecked{
    //         tokenBalance[msg.sender] -= _amount;
    //         tokenBalance[_to] += _amount;
    //     }

    //     return true;
    // }
    // in the above function, using unchecked enables rollover of uint , without unchecked, no 
    // rollover in 0.8 versions


}