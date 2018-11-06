var Election =artifacts.require("./Election.sol");
contract("Election",function(accounts){
	var electionInstance;
			
  it("initializes with two candidates",function(){
			  return Election.deployed().then(function(ins){
						  return ins.candidatesCount();
					}).then(function(count){
						assert.equal(count, 2);
					});
		});	
		it(" initializes candidates with correct values",function(){
			return Election.deployed().then(function(ins){
						electionInstance = ins;
						return electionInstance.candidates(2)
			}).then(function(candidate){
				assert.equal(candidate[0], 2, "contains correct id");
				assert.equal(candidate[1], "Candidate 2", "contains correct name");
				assert.equal(candidate[2], 0, "contains correct vote count");
			});
});	
		 
});
