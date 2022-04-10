// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract ExceptionExample{

    address public owner;

    mapping(address => uint64) public balanceReceived;


    constructor(){
        owner = msg.sender;

    }

    function destroySmartContract() public{
        require(msg.sender == owner,"you are not the onwer");
        selfdestruct(payable(owner));
    }

    function convertWeiToEther(uint amountInWei) public pure returns(uint){
        return amountInWei/ 1 ether;
        // pure functuions doest react with any of the storage variables
        // pure function can call other pure functions but cannot call view or writing functions
    }






    function receiveMoney()public payable{
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public{
        require(_amount<= balanceReceived[msg.sender],"you dont have enough ether");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    // fallback function 
    receive () external payable {
        receiveMoney();
    }

    // assert is commonly used for checking internal variable state
    // uint64 can take about 18 ether, giving more than that results in wraparound of uint and 
    // the particular address will get false amount of ether, assert can solve the above problem


    // there are 3 ways of sending ether to smart contract even after there are no payable or fallback or any other means of sending 
    // ether : -> 1)selfdestruct any other smart contract and recipient address is given of target smart contract   2) mining reward recipeient
    // is the target smart contract  3)ether send to smart contract before deployment, asserting the balance recevied with balance of smart
    // contract will result error
}