pragma solidity ^0.4.24;
contract Election {
//model the candidate
struct Candidate {
	uint id;
	string name;
	uint voteCount;
}
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
}