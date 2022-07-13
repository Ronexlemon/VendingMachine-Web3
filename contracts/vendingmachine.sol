// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;
contract vendingmachine{
address public owner;
mapping(address => uint) vendingbalance;

constructor(){
    owner = msg.sender;
    vendingbalance[address(this)] = 100;
}
function getvendingmachinebalance()public view returns(uint){
    return vendingbalance[address(this)];

}

function restock(uint amount)public {
     require(msg.sender == owner,"only owner can restock");
    vendingbalance[address(this)] +=amount;
}
function purchase(uint amount) public payable{
require(msg.value >=  amount *2 ether,"you must pay atleast two ether per coffee");
 require(vendingbalance[address(this)] >= amount, "not enough coffee");
vendingbalance[address(this)] -=amount;
vendingbalance[msg.sender] +=amount;

}

}