// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;


contract examples1{

    struct Payment{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint =>Payment) payments;
    }

    mapping(address=>Balance)public balanceReceived;

    function getBalance()public view returns(uint){
        return address(this).balance;

    }

    function sendMoney()public payable{
        balanceReceived[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;


    }

    function withdrawAllMoney(address payable _to)public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
        // the above order follows check-effects-interaction pattern ,
        // first check is made after which effects are introduced and then interaction is done
    }

    function withdrawMoney(address payable _to,uint _amount)public {
        require(balanceReceived[msg.sender].totalBalance >= _amount,"not sufficient balance");
        balanceReceived[msg.sender].totalBalance -=_amount;
        _to.transfer(_amount);
    }

}