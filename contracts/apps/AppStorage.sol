/*
 * SPDX-License-Identitifer:    MIT
 */

pragma solidity ^0.4.24;

import "../common/UnstructuredStorage.sol";
import "../kernel/IKernel.sol";


contract AppStorage {
    using UnstructuredStorage for bytes32;

    bytes32 internal constant KERNEL_POSITION = 0xffa6669c3b3ceaed213fc7fd554286ca87479c6e475d1899db2e417b9e7d4f0b;
    bytes32 internal constant APP_ID_POSITION = 0xe56c578d5c9d56a233796cc90fd981f899a3424722e0bd5d232e44ea3d7b27fb;

    function kernel() public view returns (IKernel) {
        return IKernel(KERNEL_POSITION.getStorageAddress());
    }

    function appId() public view returns (bytes32) {
        return APP_ID_POSITION.getStorageBytes32();
    }

    function setKernel(IKernel _kernel) internal {
        KERNEL_POSITION.setStorageAddress(address(_kernel));
    }

    function setAppId(bytes32 _appId) internal {
        APP_ID_POSITION.setStorageBytes32(_appId);
    }
}
