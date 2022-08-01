/**
 *Submitted for verification at Etherscan.io on 2022-04-26
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract staking  {

    
    string public name = 'staking' ;
    address  public owner ;
    uint public startTime = block.timestamp;
    uint public endTime ;




    struct Plan {
        uint  time1;
        uint time2;
    }

Plan plan;



    address[] public stakers;

    mapping(address=> uint) public totalbalance;
    mapping(address=> bool) public hasStaked;
    mapping(address=> bool) public isStaking;
     mapping(address => uint256) public Stakingbalance;
    
    constructor ( ) {
        owner = msg.sender; 
    }

       
     function transfer(address from, address to, uint tokens) internal {
        totalbalance[msg.sender] = totalbalance[msg.sender] - tokens;
        totalbalance[to] = totalbalance[to] + tokens;
        
    }
     function _mint(address account, uint256 amount) public  {
        require(account != address(0), "ERC20: mint to the zero address");
        totalbalance[account] += amount;      
    }

   
 uint internal Plann;

function stakingtoken ( uint amount, uint _plan)  public {
   require(amount > 0);
    require ( _plan == 5 || _plan == 10);
    if(_plan == 5){
        endTime = startTime + 300;
    } if (_plan == 10) {
        endTime = startTime + 600;
    }
    
        transfer(  msg.sender ,address(this) , amount );
    Stakingbalance[msg.sender ] = Stakingbalance[msg.sender] + amount;

_plan = Plann;

if (!hasStaked[msg.sender]){
    stakers.push(msg.sender);
}

isStaking[msg.sender] = true;
hasStaked[msg.sender] = true;

}



function Unstake () public {
   uint balance = Stakingbalance[msg.sender];
   require(balance>0);
   transfer( msg.sender , address(this), Stakingbalance[msg.sender]);


   Stakingbalance[msg.sender] = 0;
   isStaking[msg.sender] = false;
   

    }



function reward ( uint _plan) public {
    require(msg.sender == owner);
    require ( _plan == 5 || _plan == 10);
    

     uint balance;

    for( uint i=0 ; i< stakers.length; i++){
        address recpt = stakers[i];

        if (_plan == 5){
             balance = Stakingbalance[recpt] / 10 ;
        }
        if ( _plan == 10){
            balance = Stakingbalance[recpt] / 15 ;
        }

    Stakingbalance[msg.sender ] = Stakingbalance[msg.sender] + balance;
    totalbalance[msg.sender] = Stakingbalance[msg.sender]  ; 

    if(balance>0 ){
  transfer( msg.sender , recpt, totalbalance[msg.sender] );
    }
       
    
}

}
}