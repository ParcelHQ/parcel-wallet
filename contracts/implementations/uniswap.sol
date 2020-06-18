pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./ParcelStorage.sol";


contract Uniswap is ParcelStorage {
    function swap(address[] calldata path, uint256 amountInEth)
        external
        payable
    {
        uint256[] memory returnedAmount = getAmount(path, amountInEth);
        uniswap.swapExactETHForTokens.value(msg.value)(
            returnedAmount[1],
            path,
            msg.sender,
            now + 12000
        );
    }

    function getAmount(address[] memory path, uint256 amountInEth)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory returnedAmount = uniswap.getAmountsOut(
            amountInEth,
            path
        );
        return returnedAmount;
    }

    function getHash(address[] memory path, uint256 amountInEth)
        public
        pure
        returns (bytes memory)
    {
        return
            abi.encodeWithSignature(
                "swap(address[],uint256)",
                path,
                amountInEth
            );
    }
}
