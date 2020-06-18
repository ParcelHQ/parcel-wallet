pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./ParcelStorage.sol";


contract Compound is ParcelStorage {
    function deposit(uint256 msgValue) external payable {
        cEth.mint.value(msgValue)();
    }

    function depositAndBorrow(uint256 daiValue) external payable {
        cEth.mint.value(daiValue)();
        address[] memory toEnter = new address[](1);
        toEnter[0] = cEthAddress;
        comptroller.enterMarkets(toEnter);
        cDai.borrow(daiValue);
    }

    function getHashDeposit(uint256 value) public pure returns (bytes memory) {
        return abi.encodeWithSignature("deposit(uint256)", value);
    }

    function getHashBorrow(uint256 value) public pure returns (bytes memory) {
        return abi.encodeWithSignature("depositAndBorrow(uint256)", value);
    }
}
