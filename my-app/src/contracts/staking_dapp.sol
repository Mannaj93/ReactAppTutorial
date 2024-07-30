// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

import "./Dummy_token.sol";
import "./Tether.sol";

contract staking_Dapp{
    string public name = "Staking Dapp";
    address public owner;
    dummy public dummy_token;
    tether public tether_token;

    address[] public stakers;
    mapping(address => unit) public stakingbalance;
    mapping(address => bool) public hasstaked;
    mapping(address => bool) public isstaked;

    constructor (dummy _dummytoken, tether _tethertoken) public {
        dummy_token = _dummytoken;
        tether_token = _tethertoken;
        owner = msg.sender;
    }

    function staketoken(unitt _amount) public{
        require(_amount >0 , "Amount can not be Zero");
        tether_token.transferfrom(msg.sender, address(this), _amount);
        stakingbalance[msg.sender] = stakingbalance[msg.sender] + _amount;

        if(!hasstaked [msg.sender])
        {
            stakers.push(msg.sender);
        }

        isstaking[msg.sender] = true;
        hasstaked[msg.sender]= true;

    }

    function unstaketoken() public
    {
        uint balance = stakingbalance[msg.sender];
        require(balance > 0 , "staking balance is zero");
        tether_token.transfer(msg.sender, balance);
        stakingbalance[msg.sender]= 0;
        isstaking[msg.sender] = false;

    }

    function issuedummy () public {
        require(msg.sender == owner, "Caller must be the owner");
        for (uint  i=0; i<stakers.length; i++)
        {
            address recipient = staker[i];
            uint balance = stakingbalance[recipient];
            if (balance> 0) 
            {
                dummy_token.transfer(recipient,balance);
            }
        }
    }
}