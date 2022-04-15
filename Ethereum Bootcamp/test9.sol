// SPDX-License-Identifier: MIT


pragma solidity ^0.8.9;

library Search {
    uint256 public constant mask = type(uint256).max;
    function indexOf(uint[] storage self, uint value)public view returns(uint){
        for (uint i = 0; i < self.length; i++)
            if (self[i] == value) 
                return i;
        return mask;
    }
}


contract NotUsingForExample {
    uint256 public constant mask2 = type(uint256).max;

    uint[] data;
    function append(uint value) public {
        data.push(value);
    }

    function replace(uint _old, uint _new) public {
    // This performs the library function call
        uint index = Search.indexOf(data,_old);
        if (index == mask2)
            data.push(_new);
        else
            data[index] = _new;
    }
}


contract UsingForExample {

    uint256 public constant mask2 = type(uint256).max;


    using Search for uint[];
    uint[] data;

    function append(uint value) public {
        data.push(value);
    }

    function replace(uint _old, uint _new) public {
    // This performs the library function call
        uint index = data.indexOf(_old);
        if (index == mask2)
            data.push(_new);
        else
            data[index] = _new;
        }
    }
