pragma solidity 0.8.9;
  
contract Contract {
  uint public age;
  
  constructor(){
     age = 30;
    }
  
  function changeAge() public returns(uint) {
     uint age2 = age; // assign storage -> memory creates copy
     age = 20;
     return age2; // returns 30
  }

  function vote() public returns(uint[] memory) {
    uint[] memory ages = new uint[](2);
    ages[0] = 2;
    ages[1] = 3;
     
    uint[] memory newages = ages; // assign reference memory variable to a reference memory variable
    ages[0] = 7;
    return newages; // returns (7,3)
  }

   uint[] ages;
     
  function vote2() public returns(uint[] memory) {
    ages = new uint[](2); // storage
    ages[0] = 2;
    ages[1] = 3;
 
    uint[] storage newages = ages; // from storage to local storage
    ages[0] = 7;
    return newages; //returns (7,3)
  }
  
}