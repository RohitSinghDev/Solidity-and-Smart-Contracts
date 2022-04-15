pragma solidity ^0.6.0;

contract FoodTrack1{
    string public vendor_id;
    address public addr_vendor1;
    string public product_id;

    uint count;

    constructor()public{
        count = 0;
    }

    mapping(string=>mapping(uint=>food_info)) public food_track;

    

    struct food_info{
        string location;
        string city;
        string product;
        string date;
    }

    mapping(string=>uint) public food_step;

    function initiateVendorInfo(string memory vendor_new, string memory product_new) public{
        addr_vendor1 = msg.sender;
        vendor_id = vendor_new;
        product_id = product_new;


    }

    function food_info_store(string memory location_new,string memory city_new, string memory product_new, sting memory date_new)public{
        require(msg.sender==0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,"not authorised");
        food_track[product_id][count] = food_info(location_new,city_new,product_new,date_new);
        count++;

    }
}