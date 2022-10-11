// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Energy {

    //have total supply
    //transferrable
    //name
    //symbol
    //user balance

    ///State Variables //////

    uint  constant totalSupply = 10000 ;
    uint public circulatingSupply;
    string constant name  = "Energy";
    string constant symbol = "ERG";
    address owner;

    mapping(address => uint) public _balance;

    constructor(){
        owner = msg.sender;
        mint(10000);

    }

    function _name() public pure returns(string memory){
        return name;
    }

    function _symbol() public pure returns(string memory){
        return symbol;
    }

    function _totalSupply() public pure returns(uint){
        return totalSupply;
    }

    function mint(uint amount) private returns(uint){
        require(owner == msg.sender, "No permission");
        circulatingSupply += amount;  // increase total circulating supply
        require(circulatingSupply <= totalSupply, "totalSupply Exceeded");
        _balance[address(this)] += amount; //increase balance of to
        return amount;

    }

    function transfer(address _to, uint amount) external {
        require(_to != address(0), "Can't tranfer to address zero");
        uint userBalance = _balance[msg.sender];
        require(userBalance >= amount, "insufficient funds");
        _balance[msg.sender] -= amount;
        _balance[_to] += amount;

    }

    function disperse(address receiver, uint256 amount) external {
        require(_balance[address(this)] >= amount);
        _balance[address(this)] -= amount;
        _balance[receiver] += amount;
    }

    function balanceOf(address who) public  view returns (uint){
    return _balance[who];
    }

}