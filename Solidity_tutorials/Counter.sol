pragma solidity ^0.6.0;

contract Counter{
    uint count;
    // it is a state varaible , gets stored in blockchain, permanent values

    // we need a starting point for the operations on count variable and we need to specify what it is
    // constructor function runs only once when the smart contract is deployed to blockchain
    // we need constructor to be public so that it can be run in migration
    constructor()public{
        count = 0;

    }

    function getCount() public view returns(uint){
        // whne we want the function to be accessible outside the smart contract
        // view means we only want to view the value of count var and not chnage it
        return count;
    }

    function incrementCount()public{
        count +=1;
    }



}
