pragma solidity ^0.6.0;

contract MyContract3{

    // mappings
    mapping(uint=>string) public names;

    mapping(string=>Book) public Books;

    //nested mapping
    mapping(address=>mapping(string=>Book)) public MyMapping;


    struct Book{
        uint price;
        string author;
    }

    constructor() public{
        names[1] = "adam";
        names[2] = "singh";
        names[3] = "rohit";
        names[99] = "anshu";
    }

    function addBooks(string memory book_name,uint price, string memory author) public {
        Books[book_name] =  Book(price,author);
    }

    function MyMap(string memory book_name, uint price, string memory author)public{
        MyMapping[msg.sender][book_name] = Book(price,author); //msg.sender gives the etheruem address of the user calling the function
    }

}