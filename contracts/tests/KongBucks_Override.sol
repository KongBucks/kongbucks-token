pragma solidity ^0.8.6;

import "../KongBucks.sol";



  contract KongBucks_Override is KongBucks {

    constructor( address _originalTokenContract, bytes memory m) KongBucks(_originalTokenContract,m) {
 
    }

  function initialize() internal override{
    

    epochCount = 100;

    miningTarget = _MAXIMUM_TARGET;

   // assertEq(totalSupply, 21000000 * 10**uint(decimals),"Incorrect total supply");
    
    maxSupplyForEra = totalSupply - (totalSupply / ( 2**(rewardEra + 1)));

  //  assertEq(maxSupplyForEra, 10500000 * 10**uint(decimals),"Incorrect total supply");

  }


  function setMiningTarget(uint256 _miningTarget) public {
    miningTarget = _miningTarget;
  }

  function startNewMiningEpoch() public {
    super._startNewMiningEpoch();
  }

  function reAdjustDifficulty(uint _d) public {
    super._reAdjustDifficulty(_d);
  }

}