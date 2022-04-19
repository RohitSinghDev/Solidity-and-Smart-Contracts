// SPDX-License-Identifier: MIT


pragma solidity ^0.8.9;

 contract A {
    uint private x = 123;
}

contract B is A {
    uint public x = 234;
}

/**/