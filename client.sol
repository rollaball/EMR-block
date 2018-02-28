pragma solidity ^0.4.19;
import "./ownable.sol";
contract client is Ownable{
   struct user {
        string name;
        uint8 gender;
        string DOB;
        string aadhar;
        string phno;
        string email;
        uint id;
        address erc_add;
    }
    uint ID=1;
    user test_user;
    user[] users;
    
    uint x; 
     mapping(uint => address) idToAddress;
     mapping(address => uint) addressToId;
     
    modifier owned(uint id){
        require(msg.sender==idToAddress[id]);
        _;
    } 
    modifier check_validity(address z){
        require(addressToId[z]==0);
        _;
    }
    modifier check_if_present(address z){
        require(addressToId[z]!=0);
        _;
    }
    function client() public{
        users.push(test_user);
    }
    
    function new_account() public check_validity(msg.sender)returns(uint){
       
       idToAddress[ID]=msg.sender;                             //Remove if not used
       addressToId[msg.sender]=ID;                             //Remove if not used
       test_user.erc_add=msg.sender;                           
       users.push(test_user);
       ID++;
       return ID;
   }
    function set_info(string _name,uint8 _gender,string _DOB,string _aadhar,string _phno,string _email) public check_if_present(msg.sender){
        x=addressToId[msg.sender];
        users[x].name=_name;
        users[x].gender=_gender;
        users[x].DOB=_DOB;
        users[x].aadhar=_aadhar;
        users[x].phno=_phno;
        users[x].email=_email;
        users[x].id=x;
     //   users[id].erc_add=msg.sender;
    }
    
    function get_info(uint id) view public owned(id) returns(string,uint8,string,string,string,string,address) 
    {
        
        return (users[id].name,users[id].gender,users[id].DOB,users[id].aadhar,users[id].phno,users[id].email,users[id].erc_add);
    }
    function get_add() view public returns(address){
        return msg.sender;
    }
    
    
    
    
    
    
    ////////////
    function strConcat(string _a, string _b, string _c, string _d, string _e) pure internal returns (string){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d);
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
    for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
    return string(babcde);
}

function strConcat(string _a, string _b, string _c, string _d) internal pure returns (string) {
    return strConcat(_a, _b, _c, _d, "");
}

function strConcat(string _a, string _b, string _c) internal pure returns (string) {
    return strConcat(_a, _b, _c, "", "");
}

function strConcat(string _a, string _b) internal pure returns (string) {
    return strConcat(_a, _b, "", "", "");
}
//////////////
}