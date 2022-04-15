// EVENTS: 
// Event is an inheritable member of a contract. An event is emitted, it stores the arguments passed in transaction logs. These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain. An event generated is not accessible from within contracts, not even the one which have created and emitted them.





// VIEW FUNCTIONS:
// View functions ensure that they will not modify the state. A function can be declared as view. The following statements if present in the function are considered modifying the state and compiler will throw warning in such cases.

//     Modifying state variables.

//     Emitting events.

//     Creating other contracts.

//     Using selfdestruct.

//     Sending Ether via calls.

//     Calling any function which is not marked view or pure.

//     Using low-level calls.

//     Using inline assembly containing certain opcodes.

// Getter method are by default view functions.



// PURE FUNCTIONS:
// Pure functions ensure that they not read or modify the state. A function can be declared as pure. The following statements if present in the function are considered reading the state and compiler will throw warning in such cases.

//     Reading state variables.

//     Accessing address(this).balance or <address>.balance.

//     Accessing any of the special variable of block, tx, msg (msg.sig and msg.data can be read).

//     Calling any function not marked pure.

//     Using inline assembly that contains certain opcodes.

// Pure functions can use the revert() and require() functions to revert potential state changes if an error occurs.




// Libraries are similar to Contracts but are mainly intended for reuse. A Library contains functions which other contracts can call. Solidity have certain restrictions on use of a Library. Following are the key characteristics of a Solidity Library.

//     Library functions can be called directly if they do not modify the state. That means pure or view functions only can be called from outside the library.

//     Library can not be destroyed as it is assumed to be stateless.

//     A Library cannot have state variables.

//     A Library cannot inherit any element.

//     A Library cannot be inherited.
// library Search {
//    function indexOf(uint[] storage self, uint value) public view returns (uint) {
//       for (uint i = 0; i < self.length; i++) if (self[i] == value) return i;
//       return uint(-1);
//    }
// }
// contract Test {
//    uint[] data;
//    constructor() public {
//       data.push(1);
//       data.push(2);
//       data.push(3);
//       data.push(4);
//       data.push(5);
//    }
//    function isValuePresent() external view returns(uint){
//       uint value = 4;
      
//       //search if value is present in the array using Library function
//       uint index = Search.indexOf(data, value);
//       return index;
//    }
// }
