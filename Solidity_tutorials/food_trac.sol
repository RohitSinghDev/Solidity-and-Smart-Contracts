pragma solidity ^0.6.0;

contract Main1{

    uint step;
    address authority;

    address[] public farms;
    address[] public factories;
    address[] public company;

    constructor() public{
    
        step = 0;
        authority = msg.sender;
        vendor_accs["fm"] = farms;
        vendor_accs["mfg"] = factories;
        vendor_accs["cmp"] = company;



    }

    
    
    // main mapping
    mapping(string=>mapping(uint=>food_info)) public food_tracker;

    // mapping for step
    mapping(string=>uint) public food_step;
    mapping(string=>bool) public food_present;
    

    // mapping for auth
    mapping(string=>address[]) public vendor_accs;


    struct food_info{
        string location;
        string workSpace;
        string product;
    }

    function auth_func(string memory vendor,address vendor_acc) public{
        require(msg.sender==authority,"not authorised");
        vendor_accs[vendor].push(vendor_acc);





    }

    function check_exist(string memory vendor_t) public view returns(bool){
        bool flag = true;
        for(uint i=0;i<vendor_accs[vendor_t].length && flag;i++)
        {
            if(vendor_accs[vendor_t][i]==msg.sender)
            {
                flag = false;
            }
        }
        return flag;
    
        
    }

    function cmp_func(string memory id) public {
        bool flag = true;
        // for(uint i=0;i<vendor_accs["cmp"].length && flag;i++)
        // {
        //     if(vendor_accs["cmp"][i]==msg.sender)
        //     {
        //         flag = false;
        //     }
        // }
        flag = check_exist("cmp");

        require(flag==false,"invalid company");
        food_step[id] = 0;
        food_present[id] = true;
        
    
    }

    function vendors_func(string memory location, string memory product, string memory workspace, string memory id) public {
        bool flag_fm = true;
        bool flag_mfg = true;
        flag_fm = check_exist("fm");
        flag_mfg = check_exist("mfg");

        require(flag_fm==false || flag_mfg==false,"invalid vendor");
        require(food_present[id]==true,"invallid food id");

        food_tracker[id][food_step[id]] = food_info(location,workspace,product);
        food_step[id]++;






    }

    string public final_track = " ";
    string st1;

    function food_tracking(string memory id) public{
        
        for(uint i=0;i<food_step[id];i++)
        {
            
            st1 = food_tracker[id][i].location + "-" + food_tracker[id][i].workSpace + "-" + food_tracker[id][i].product + "\n";
            final_track += st1;

        }
    }





}