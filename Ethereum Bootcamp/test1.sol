// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract test1{
    string public hello = "helo world";
    int public var1;
    // default initialisation of uint and int is 0
    // default value of address is 0
    // memory in function arguments are used for references 
    // strings cannot be concatenated
    // strings are internally stored as bytes array
    //2**8 exponent
    // wraparound function shpuld have given the max value that could be stored in that datatype var,
    // but it doesnt work in solidity version 0.8 and above. it can work with unchecked
    // payable should be present in the function when we are sending in the money to the contract


    // address public address1;

    // uint8 public myuint;
    

    // function setAddress(address addr)public{
    //     address1 = addr;
    // }

    // function getAddress()public view returns(uint) {
    //     return address1.balance;
    // }

    // function wraparound()public {
    //     myuint--;
    // }
    // function wraparound2()public{
    //     unchecked{
    //         myuint--;
    //     }
    // }
    uint public balanceReceived;

    function receiveBalance() public payable{

        balanceReceived+= msg.value;


    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney()public{
        address to = msg.sender;//implicitly cannot be converted to payable type
        // payable(to).transfer(address(this).balance);
        payable(to).transfer(this.getBalance());
    }

    function withdrawMoneyto(address payable _to)public{
        _to.transfer(this.getBalance());
    }



}