// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalPiggybank{
    address public owner;
    string public piggybankName;
    uint public savingsObjective;
    bool public openPiggybank;

    constructor(string memory _initialName, uint _savingsObjective) {
        owner = msg.sender;
        piggybankName = _initialName;
        savingsObjective = _savingsObjective;
        openPiggybank = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You're not the owner.");
        _;
    }

    function addSavings() public payable {
        require(openPiggybank, "Piggybank is closed.");
    }

    function changePiggybankName(string memory _newPiggybankName) public onlyOwner {
        piggybankName = _newPiggybankName;
    }

    function changeSavingsObjective(uint _newObjective) public onlyOwner {
        savingsObjective = _newObjective;
    }

    function changeopenPiggybankState() public onlyOwner {
        openPiggybank = !openPiggybank;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function objectiveAchieved() public view returns(bool) {
        return savingsObjective <= address(this).balance;
    }
}