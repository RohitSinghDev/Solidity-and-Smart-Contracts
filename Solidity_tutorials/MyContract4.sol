pragma solidity ^0.6.0;

contract MyContract4{

    uint[] public numbers = [1,2,3,4,5,6];

    address public owner;//owner is the account that deployed the smart contract in ethereum network

    constructor()public{
        owner = msg.sender;
    }

    function countEven()public view returns(uint){
        uint count = 0;
        for(uint i=0;i<numbers.length;i++)
        {
            if(evenNumber(numbers[i])){
                count++;
            }

        }
        return count;


    }


    // conditionals
    function evenNumber(uint _number)public pure returns(bool){
        if(_number%2==0){
            return true;
        }
        else
        {
            return false;
        }
    }
    
    function isOwner()public view returns(bool){
        return (msg.sender==owner);
        // if(msg.sender==owner){
        //     return true;

        // }
        // else
        // {
        //     return false;
        // }

    }
}