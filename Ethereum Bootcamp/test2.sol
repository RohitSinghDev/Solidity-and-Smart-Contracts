// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract startStopDataExmaple{

    bool paused;

    function sendMoney()public payable {

    }

    function pauseContract(bool _pause)public{
        paused = _pause;

    }

    function withdrawMoney(address _to)public {
        require(!paused,"contract is paused");
        payable(_to).transfer(address(this).balance);


    }

    function smartContract(address payable _to)public{
        selfdestruct(_to);
        // the functions after self destruct seem to work but no work is performed by the functions
        // after this call the state of network is not changed by this contract, since selfdestruct gives instruction to blockchain to remove smart contract from state
    }
}