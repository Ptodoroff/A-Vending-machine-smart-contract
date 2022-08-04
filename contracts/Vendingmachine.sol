 pragma solidity 0.8.15;


 contract VendingMachine {
    address public owner;
    mapping(address=>uint) public balances;

    modifier onlyOwner {
        require(owner==msg.sender, "You cannot execute this function");
        _;
    }

    constructor () {
        owner=msg.sender;
        balances[address(this)]=100;                       //this points to the address of the contract

    }


    function getBalance () public view returns (uint) {
        return balances[address(this)];                      // returns the baalance of the contract
    }


    function restock (uint _amount) external onlyOwner {
        balances[address(this)]+=_amount;
    }


    function purchase (uint _amount) external payable {                                       //important to remember to declare function that accept ether as payable! 
        require(_amount <= balances[address(this)], "Not enough donuts in the machine");
        require(msg.value==_amount * 0.1 ether, "The price of a donut is 0.1 eth");                                             // I define the price of the donuts here.
        balances[address(this)]-= _amount;
        balances[msg.sender]+=_amount;


    }






 }