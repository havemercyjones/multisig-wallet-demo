// contracts/MultiSig.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSig {
    address[3] public owners;
    mapping(bytes32 => uint8) public approvals;

    constructor(address[3] memory _owners) {
        owners = _owners;
    }

    function approve(bytes32 txId) external {
        bool isOwner;
        for (uint256 i = 0; i < 3; i++) {
            if (msg.sender == owners[i]) {
                isOwner = true;
                break;
            }
        }
        require(isOwner, "not owner");
        approvals[txId]++;
    }
}
