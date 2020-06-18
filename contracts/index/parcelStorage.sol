pragma solidity ^0.5.0;

import "./uniswapInterface.sol";
import "./cTokenInterface.sol";
import "./ERC20.sol";
import "./comptrollerInterface.sol";

import "./../"


contract ParcelStorage {
    address public uniswapRouterAddress = 0xf164fC0Ec4E93095b804a4795bBe1e041497b92a;
    UniswapInterface uniswap = UniswapInterface(uniswapRouterAddress);
    address WETH_KOVAN = 0xd0A1E359811322d97991E03f863a0C30C2cF029C;
    address DAI_KOVAN = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;
    address cEthAddress = 0xf92FbE0D3C0dcDAE407923b2Ac17eC223b1084E4;
    cTokenInterface cEth = cTokenInterface(cEthAddress);
    address cDaiAddress = 0xe7bc397DBd069fC7d0109C0636d06888bb50668c;
    cTokenInterface cDai = cTokenInterface(cDaiAddress);
    address comptrollerAddress = 0x1f5D7F3CaAC149fE41b8bd62A3673FE6eC0AB73b;
    comptrollerInterface comptroller = comptrollerInterface(comptrollerAddress);
    cTokenInterface dai = cTokenInterface(DAI_KOVAN);
    address public owner;
}
