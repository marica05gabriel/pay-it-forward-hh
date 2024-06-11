// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract PaperBook is ERC1155 {
    uint256 private index = 0;
    mapping(uint256 => bool) private _exists;
    mapping(uint256 => string) private _isbn;

    constructor() ERC1155("no-uri") {}

    function mint(string memory isbn13) public {
        _isbn[index] = isbn13;
        _exists[index] = true;

        _mint(msg.sender, index, 1, bytes(isbn13));

        index++;
    }

    function isbn(uint256 id) public view virtual returns (string memory) {
        return _isbn[id];
    }

    function exists(uint256 id) public view virtual returns (bool) {
        return _exists[id];
    }
}
