pragma solidity ^0.4.19;
import "./client.sol";
contract emr_con is client{
    /*   struct test{
        string name;
        string test_result;
    }*/
    struct emr{
        uint date;
        string problem;
        string medication;
        string tests;
        string result;
        uint eid;
        uint patient_id;
        mapping (uint=>uint) idToPerm;
    }
    

    uint[] emr_ids;
   
    
    mapping(uint => uint[]) patToEmrArr;
    emr[] public emrs;
    uint eid_c=0;
    
    
    emr test;//used in create_emr to push onto the array;
    //function create_test_array(test[] _tests)
    
    
    
    modifier check_if_owner(uint eid){
        require(idToAddress[emrs[eid].patient_id]==msg.sender);
        _;
    }
    
    modifier check_if_doc_perm(uint eid){
        require(emrs[eid].idToPerm[addressToId[msg.sender]]!=1);
        if(emrs[eid].idToPerm[addressToId[msg.sender]]==2)
            emrs[eid].idToPerm[addressToId[msg.sender]]=0;
            
        _;
    }
    
    
    
    
    
    //need 2 versions of get_emr
    
    
    
    
    
}