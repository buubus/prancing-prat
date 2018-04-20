pragma solidity ^0.4.0;

contract simpleContract {

    uint256 myNumber;
    address owner;

    modifier ownerOnly(){
        if (owner == msg.sender){
            _;
        } else {
            revert();
        }
    }

    function simpleContract(){
        myNumber = 3;
        owner = msg.sender;

    }

    function getBalance() constant public returns(uint256){
        return myNumber;
    }

    function getOwner() constant public returns(address){
        returns owner;
    }

    function changeNumber (uint256 newNumber) public {
        myNumber = newNumber;
    }

    function kill () ownerOnly{
        selfdestruct(owner);
    }
}
