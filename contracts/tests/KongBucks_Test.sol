// Adds Test library to the context
 

import "./Testable.sol";
import "../KongBucks.sol";

pragma solidity ^0.8.6;

// `_Test` suffix means it is a test contract
contract KongBucks_Test is Testable,KongBucks(address(0),"") {


  receive() external payable override(Testable, KongBucks) {}

  function initialize() internal override{

    epochCount = 100;

    miningTarget = _MAXIMUM_TARGET;

    assertEq(totalSupply, 21000000 * 10**uint(decimals),"Incorrect total supply");
    
    maxSupplyForEra = totalSupply - (totalSupply / ( 2**(rewardEra + 1)));

    assertEq(maxSupplyForEra, 10500000 * 10**uint(decimals),"Incorrect total supply");

  }
 
    // `_test` suffix means it is a test function
    function test_miningEpoch() public {

        super._startNewMiningEpoch();

        assertEq(epochCount,101,"invalid epoch count");
    }

    function test_adjustDifficuly() public {

    assertEq(miningTarget,_MAXIMUM_TARGET,"invalid mining target");

    super._reAdjustDifficulty(600);

    assertEq(epochCount,100,"invalid epoch count");
    //assertEq(miningTarget,_MAXIMUM_TARGET,"invalid mining target");

    miningTarget = _MAXIMUM_TARGET;
    super._reAdjustDifficulty(1);


    miningTarget = _MAXIMUM_TARGET;
    super._reAdjustDifficulty(1024);

    miningTarget = _MAXIMUM_TARGET;
    super._reAdjustDifficulty(1024*60);
  }

  
}