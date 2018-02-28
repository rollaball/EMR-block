pragma solidity ^0.4.19;
import "./emr.sol";

contract doctor is emr_con{
    
    string a;
    function create_emr(string _problem,string _medication,string _tests,string _result,uint patid,uint docid) public owned(docid)returns(uint){
        eid_c++;
  /*      uint[] storage x;
        x.push(docid);
        emrs.push(emr(now,_problem,_medication,_tests,_result,eid_c,patid,x);*/
        
        test.date=now;
        test.problem=_problem;
        test.medication=_medication;
        test.tests=_tests;
        test.result=_result;
        test.eid=eid_c;
        test.patient_id=patid;
        test.idToPerm[docid]=1;
        
        emrs.push(test);
        patToEmrArr[patid].push(eid_c);
        return eid_c;
    }
    
    function get_emr(uint eid) view public check_if_doc_perm(eid) returns(uint,string,string,string,string) {
        return(emrs[eid].date,emrs[eid].problem,emrs[eid].medication,emrs[eid].tests,emrs[eid].result);
    }
    
    function get_history(uint pid) public returns(string){
        a="";
        for(uint i=0;i<patToEmrArr[pid].length;i++){
            strConcat(a,emrs[i].problem,"\n");
        }
        return a;
    }
    
    
}