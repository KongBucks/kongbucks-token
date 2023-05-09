// Adds Test library to the context
 pragma solidity ^0.8.6;

import "./Testable.sol";
import "../KongBucks.sol";
import "./KongBucks_Override.sol";


// `_Test` suffix means it is a test contract
contract KongBucks_Test is Testable {

  KongBucks_Override public kongBucks;
    uint public  _MINIMUM_TARGET = 2**16;      
    uint public  _MAXIMUM_TARGET = 2**234;


  function setUp() public {
    kongBucks = new KongBucks_Override(address(0),"");
  }

  //receive() external payable override(Testable, KongBucks) {}

 
    // `_test` suffix means it is a test function
    function test_miningEpoch() public {

        kongBucks.startNewMiningEpoch();

        assertEq(kongBucks.epochCount(),101,"invalid epoch count");
    }

    function test_adjustDifficuly() public {

    vm.roll(1000);

    assertEq(kongBucks.miningTarget(),_MAXIMUM_TARGET,"invalid mining target");

    kongBucks.reAdjustDifficulty(600);
 
    assertEq(kongBucks.epochCount(),100,"invalid epoch count");
    //assertEq(miningTarget,_MAXIMUM_TARGET,"invalid mining target");


    uint256 miningTarget = kongBucks.miningTarget();
    
    kongBucks.setMiningTarget(  _MAXIMUM_TARGET  ); 
    kongBucks.reAdjustDifficulty(1); 
    
    kongBucks.setMiningTarget(  _MAXIMUM_TARGET  ); 
    kongBucks.reAdjustDifficulty(1024);

    kongBucks.setMiningTarget(  _MAXIMUM_TARGET  );  
    kongBucks.reAdjustDifficulty(1024*60);


  }

  
}