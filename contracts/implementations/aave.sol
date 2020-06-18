pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
import "https://github.com/aave/aave-protocol/blob/master/contracts/interfaces/ILendingPoolAddressesProvider.sol";


interface LendingPool {
    function deposit(
        address _reserve,
        uint256 _amount,
        uint16 _referralCode
    ) external payable;
}


contract Aave {
    // Retrieve LendingPool address
    ILendingPoolAddressesProvider provider = ILendingPoolAddressesProvider(
        address(0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5)
    ); // mainnet address, for other addresses: https://docs.aave.com/developers/developing-on-aave/deployed-contract-instances
    LendingPool lendingPool = LendingPool(provider.getLendingPool());

    // Input variables
    address ethAddress = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE); // mainnet DAI
    uint256 amount = 1 * 1e18;
    uint16 referral = 0;

    function deposit() external {
        lendingPool.deposit(ethAddress, amount, referral);
    }
}
