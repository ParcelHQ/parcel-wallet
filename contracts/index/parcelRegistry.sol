pragma solidity ^0.5.0;

import "parcel.sol";


contract ParcelRegistry {
    mapping(address => address) public registered;

    modifier oneAccount {
        require(registered[msg.sender] == address(0), "account exists");
        _;
    }

    function register() external payable oneAccount returns (address) {
        Parcel newAccount = new Parcel(msg.sender);
        registered[msg.sender] = address(newAccount);
    }
}
