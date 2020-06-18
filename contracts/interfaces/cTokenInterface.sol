pragma solidity ^0.5.0;


interface cTokenInterface {
    function mint() external payable;

    function balanceOf(address _owner) external view returns (uint256 balance);

    function transfer(address _to, uint256 _value)
        external
        returns (bool success);

    function borrow(uint256 borrowAmount) external returns (uint256);
}
