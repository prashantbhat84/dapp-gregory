pragma solidity ^0.4.24;
contract Election {
//model the candidate
struct Candidate {
	uint id;
	string name;
	uint voteCount;
}
//store accounts that have voted
mapping(address=>bool)public voters;
//store candidates
//fetch candidate
mapping(uint=>Candidate) public candidates; 
//store candidate count
uint public candidatesCount;
	constructor () public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");

	}
	function addCandidate(string _name) private {
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
	}
	function vote(uint _candidateID) public {
	//addr has not voted
	require(!voters[msg.sender]);

	//is a valid candidate.
	require(_candidateID>0 && _candidateID<=candidatesCount);
	//record voter has voted
	voters[msg.sender] = true; 
		//update vote count
	candidates[_candidateID].voteCount++;
	
}
}
