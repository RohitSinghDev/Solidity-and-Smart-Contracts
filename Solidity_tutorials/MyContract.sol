pragma solidity ^0.6.0;

contract MyContract{
    // state variables
    // stored in the blockchain itself
    uint public myUint = 1; //it is bydefault uint256
    int public MyInt = -1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    string public myString = "hello world";
    bytes32 public myBytes32 = "hello world";

    address public myAddress = 0x8d76B838028FA9D8aC411134067f86635eF1f029;

    struct MyStruct{
        uint id;
        string name;
    }

    MyStruct public struct1 = MyStruct(1,"hello world"); 


    // local variable
    function getValue() public pure returns(uint){
        uint value = 1; //local to this function, this value doesnt chnage unless we tell it 
        // inside this function, it is not stored directly to blockchain but memmory inside this function
        return value;
    }


}