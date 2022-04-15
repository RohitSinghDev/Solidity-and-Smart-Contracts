// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

// currently this contract if for a single campaign/donation, we need our application to be for multiple campaigns


contract campaignFactory{
    address[] public deployedCampaigns;

    function createCampaign(uint minimum)public{
        address newCampaign = address(new Campaign(minimum,msg.sender));
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns(address[] memory){
        return deployedCampaigns;
    }
}




contract Campaign{

    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete; 
        uint approvalCount;
        mapping(address => bool) approvals;
    }
    // when we initialise the values of a struct, we only need 
    // to initialise value types, except mapping all other are value types in above struct
    //mapping is a reference type

    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;
    // above vars are storage data

    modifier restricted(){
        require(msg.sender == manager,"access not authorised");
        _;
    }

    constructor(uint minm, address creator){
        manager = creator;
        minimumContribution = minm; 
    }

    function contribute()public payable {
        require(msg.value>minimumContribution,"please increase contri money");
        approvers[msg.sender] = true;
        approversCount++;

    }

    function createRequest(string memory description, uint value, address payable recipient) public  restricted{
        // Request memory newRequest = Request(description,value,recipient,false);
        // above method not much encouraged
        
        // Request memory newRequest = Request({
        //     description: description,
        //     value : value,
        //     recipient : recipient,
        //     complete : false,
        //     approvalCount : 0
        // });

        // requests.push(newRequest);

        Request storage newRequest = requests.push();
        newRequest.description= description;
        newRequest.value = value;
        newRequest.recipient = recipient;
        newRequest.complete=false;
        newRequest.approvalCount=0;
    }

    function approveRequest(uint index) public {
        Request storage request = requests[index];

        require(approvers[msg.sender],"cannot vote without contri");
        require(!request.approvals[msg.sender],"");

        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }

    function finalizeRequest(uint index) public restricted{
        Request storage request = requests[index];
        require(request.approvalCount > (approversCount/2));
        require(!request.complete);

        payable(request.recipient).transfer(request.value);

        request.complete = true;

    }

// all the state vars are in contract's storage
// arguments to our contract's functions are memory data
}


// keys are not stored in mappings, we cannot access the keys hence
// we do not know what keys a mapping has
// the values of a mapping are not iterable, we cannot use a 
// for loop to get all the values of a mapping
// mappings are only for single value lookups
// we do not get undefine for the keys that do not exist in a mapping, we get some default value
// a mapping with values as bool, deafult values are false