pragma solidity ^0.4.0;
contract owned{
    address owner;
    
    mapping(address => Permission) PermittedAddresses;
    
    //create an event to add to logs allows interaction with Javascript.
    //Javascript listens to the logs to understand when events occured.
    event AddSenderToList (address theOwner, address newSender, uint hisMaxTransfer);
    
    event removeSender (address theOwner, address toBeRemoved);
    
    event fundSent (address theSender, address theReciever, uint theAmount);

    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }
    
    modifier ownerOnly (){
        if(owner == msg.sender){
            _;
        }else{
            revert();
        }
    }
    
    function owned (){
        owner = msg.sender;
    }
    
    function kill () ownerOnly{
        selfdestruct(owner);
    }
    
    function () public payable {}
