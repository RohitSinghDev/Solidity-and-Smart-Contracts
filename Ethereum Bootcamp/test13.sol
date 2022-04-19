// SPDX-License-Identifier: MIT


pragma solidity ^0.8.9;



contract A {
    event SomeEvent(address _addr, uint _amount);

    uint public check;
  
    receive() external payable {
        emit SomeEvent(msg.sender, msg.value);
    }
    

    // fallback () external payable {
    //     check = 1;
        
    // }

    fallback () external {
        check = 1;
        
    }
    // if only message is send and not ether then thi fallback is triggered, if ether send along 
    // with message than error cos not payable
}