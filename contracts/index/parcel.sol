pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

import "./ParcelStorage.sol";


contract Parcel is ParcelStorage {
    constructor(address _owner) public {
        owner = _owner;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    /**
     * @dev Delegate the calls to Connector And this function is ran by cast().
     * @param _target Target to of Connector.
     * @param _data CallData of function in Connector.
     */
    function _call(address _target, bytes memory _data) internal {
        require(_target != address(0), "target-invalid");
        assembly {
            let succeeded := delegatecall(
                gas(),
                _target,
                add(_data, 0x20),
                mload(_data),
                0,
                0
            )

            switch iszero(succeeded)
                case 1 {
                    // throw if delegatecall failed
                    let size := returndatasize()
                    returndatacopy(0x00, 0x00, size)
                    revert(0x00, size)
                }
        }
    }

    /**
     * @dev This is the main function
     * @param targets Array of Target(s) to of Implementation.
     * @param data Array of Calldata(s) of function.
     */
    function execute(address[] calldata targets, bytes[] calldata data)
        external
        payable
        onlyOwner
    {
        for (uint256 i = 0; i < targets.length; i++) {
            _call(targets[i], data[i]);
        }
    }

    function() external payable {}
}
