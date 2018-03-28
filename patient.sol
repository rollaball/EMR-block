pragma solidity ^0.4.19;
import "./emr.sol";

contract patient is emr_con{
    function get_emr_array() view public returns(uint[]){
        return patToEmrArr[addressToId[msg.sender]];
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
    //////////////////////
    string a;
    uint ii;
    function create_emr_doc(string _problem,string _medication,string _tests,string _result,uint patid) public returns(uint,uint,uint){
        eid_c++;
  /*      uint[] storage x;
        x.push(docid);
        emrs.push(emr(now,_problem,_medication,_tests,_result,eid_c,patid,x);*/
        ii=addressToId[msg.sender];
        test.date=now;
        test.problem=_problem;
        test.medication=_medication;
        test.tests=_tests;
        test.result=_result;
        test.eid=eid_c-1;
        test.patient_id=patid;
        
        emrs.push(test);
        emrs[eid_c-1].idToPerm[ii]=1;
        patToEmrArr[patid].push(eid_c);
        return (eid_c-1,ii, emrs[eid_c-1].idToPerm[ii]);
    }
    
    function get_emr_doc(uint eid) public view check_if_doc_perm(eid) returns(uint,string,string,string,string) {
        return(emrs[eid].date,emrs[eid].problem,emrs[eid].medication,emrs[eid].tests,emrs[eid].result);
    }
    
    function get_history_doc(uint pid) public returns(string){
        a="";
        for(uint i=0;i<patToEmrArr[pid].length;i++){
            strConcat(a,emrs[i].problem,"\n");
        }
        return a;
    }
    //////////////////////////
   /* function temp(uint ee) public view returns(uint){
        return emrs[ee].idToPerm[2];
    }*/
    
    
}