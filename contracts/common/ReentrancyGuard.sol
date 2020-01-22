/*
 * SPDX-License-Identitifer:    MIT
 */

pragma solidity ^0.4.24;

import "../common/UnstructuredStorage.sol";


contract ReentrancyGuard {
    using UnstructuredStorage for bytes32;

    bytes32 private constant REENTRANCY_MUTEX_POSITION = 0x319ba99eb358b01cb2ac92c934f0e2b1f6294c8df78e66c0670f6c95d7b646d7;

    string private constant ERROR_REENTRANT = "REENTRANCY_REENTRANT_CALL";

    modifier nonReentrant() {

        require(!REENTRANCY_MUTEX_POSITION.getStorageBool(), ERROR_REENTRANT);


        REENTRANCY_MUTEX_POSITION.setStorageBool(true);

        _;

        REENTRANCY_MUTEX_POSITION.setStorageBool(false);
    }
}
