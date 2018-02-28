pragma solidity ^0.4.19;
import "./emr.sol";

contract patient is emr_con{
    function get_emr_array(uint id) view public owned(id)returns(uint[]){
        return patToEmrArr[id];
    }
    
    function get_emr(uint eid) view public check_if_owner(eid) returns(uint,string,string,string,string){
        return(emrs[eid].date,emrs[eid].problem,emrs[eid].medication,emrs[eid].tests,emrs[eid].result);
    }
    
    function give_perm(uint patid,uint eid,uint docid) public owned(patid) check_if_owner(eid){
        emrs[eid].idToPerm[docid]=1;
    }
    function deny_perm(uint patid,uint eid,uint docid) public owned(patid) check_if_owner(eid){
        delete emrs[eid].idToPerm[docid];
    }
    
    function give_ota(uint eid, uint docid) public check_if_owner(eid){
        emrs[eid].idToPerm[docid]=2;
    }
    
    
    
    
}