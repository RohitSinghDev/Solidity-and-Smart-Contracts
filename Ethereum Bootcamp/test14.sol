// SPDX-License-Identifier: MIT


pragma solidity ^0.8.9;

contract ContractA {
    function funARequireFailure() public pure {
        require(false, "This is an error String");
    }
    
    function funBRevertFailure() public pure {
        revert("Error from Contract A");
    }
    
    function funCAssertFailure() public pure {
        assert(false);
    }
}

contract B {
    ContractA instA;
    
    event ErrorMain(string _reason);
    event LowLevelError(bytes _reason);
    
    constructor()  {
        instA = new ContractA();
    }
    
    function testRequireTryCatch() public returns(bool) {
        try instA.funBRevertFailure() {
            return true;
        } catch Error(string memory reason) {
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            emit ErrorMain(reason);
            return false;
        } catch (bytes memory lowLevelData) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            emit LowLevelError(lowLevelData);
            return false;
        }
    }
}