pragma solidity ^0.4.17;

contract Inbox{



    string public message;
    //if we create a storage var and declare it to be public, 
    // solidity craetes a function for it and same of the function
    // is same as name of the variable

    // since the name of the function is same as the contract, 
    // this is a contructor function, it gets called once automatically when the contract is deployed

    function Inbox(string initialMessage)public {
        message = initialMessage;
    }

    // only view and constant function can return value 

   

    function setMessage(string sentMessage)public{
        message = sentMessage;
    }
}