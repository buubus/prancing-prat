pragma solidity ^0.4.18;

import "./owned.sol";

contract SimpleWallet is owned {


    function addAddressToSendersList(address permitted, uint maxTransferAmount) public ownerOnly {
        PermittedAddresses[permitted] = Permission(true, maxTransferAmount);
        AddSenderToList(msg.sender, permitted, maxTransferAmount);
    }

    function sendFunds(address receiver, uint amountInWei) public {
        require(PermittedAddresses[msg.sender].isAllowed);
        require(PermittedAddresses[msg.sender].maxTransferAmount >= amountInWei);
        receiver.transfer(amountInWei);
        fundSent(msg.sender, receiver, amountInWei);
    }
    
    function removeAddressFromSendersList(address toBeRemoved) public ownerOnly {
       delete PermittedAddresses[toBeRemoved];
       removeSender(msg.sender, toBeRemoved);
    }


    

}
