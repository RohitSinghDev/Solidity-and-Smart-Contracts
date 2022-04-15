pragma solidity ^0.6.0;

contract HotelRoom{
    // ether - pay smart contracts
    // modifiers
    // visibility
    // events
    // enums

    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;
    // state var , gets written to the blockchain
    // payable means this address can receive payments in ethers

    constructor()public{

        owner = msg.sender;
        currentStatus = Statuses.Vacant;
        // msg.sender is always the user that calls this funtion, it is the ethereum address
        // and since contructor is run by the person who deployed the smart contract,
        // msg.sender is the owner of the smart contract
    }

// modifiers are useful when there are many fucntions 
    modifier onlyWhileVacant{
        require(currentStatus == Statuses.Vacant,"currently occupied");
        _;
    }

    modifier costs(uint _amount){
        require(msg.value >=_amount,"not enough ethers");
        _;
    }

    // function book() payable onlyWhileVacant costs(2 ether){//function to book the room and pay to the person who deployed the smart contract
    // we want to make function that will trigger whenevr we pay the smart contract, we send ethereum to this address
    receive() external payable onlyWhileVacant costs(2 ether){
        // require(currentStatus==Statuses.Vacant,"currently occupied");
        // require(msg.value>= 2 ether,"not enough ethers provided");
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender,msg.value);
         


    }

    // events allows external consumers to subscribe to them and find out something happend in smart contract

}