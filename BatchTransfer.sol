// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BatchTransfer {
    function batchTransfer(address payable[] memory recipients, uint256[] memory amounts) public payable {
        require(recipients.length == amounts.length, "Recipients and amounts length mismatch");
        
        for (uint i = 0; i < recipients.length; i++) {
            require(msg.value >= amounts[i], "Insufficient funds provided");
            recipients[i].transfer(amounts[i]);
        }
    }

    function whitdraw() public payable{
        payable(owner).transfer(address(this).balance);
    }
}
