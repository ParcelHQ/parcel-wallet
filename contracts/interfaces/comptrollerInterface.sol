pragma solidity ^0.5.0;


interface comptrollerInterface {
    function enterMarkets(address[] calldata cTokens)
        external
        returns (uint256[] memory);
}
