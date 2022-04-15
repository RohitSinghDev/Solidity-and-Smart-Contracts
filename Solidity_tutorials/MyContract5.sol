pragma solidity ^0.6.0;



contract Ownable{
    address owner;
    constructor()public{
        owner = msg.sender;
    }

    modifier allowSecret{
        require(msg.sender==owner,"not allowed to get secret");
        _;
    }




}


contract MyContract5 is Ownable{
    // inheritance
    // factories
    // interaction with smart contracts

    string secret;


    constructor(string memory _secret)public{
        secret = _secret;
        super;

    }


    function getSecret() public view allowSecret returns(string memory){//restricting who can call this function
        return secret;
    }
     




}