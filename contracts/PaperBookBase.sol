// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract PaperBookBase is ERC1155, Ownable {
    using Arrays for PaperBook[];
    using Arrays for uint48[];

    struct Set {
        uint48[] values;
        mapping(uint => bool) exists;
    }

    struct PaperBook {
        uint256 id;
        uint48 isbn13;
        string cid;
        uint enrolledAt;
        address enrolledBy;
    }

    uint256 private paperBookIndex;
    PaperBook[] _paperBookList;

    mapping(address account => mapping(uint48 isbn13 => uint256)) private _balancesIsbn;
    mapping(address account => uint256[] bookIdList) private _ownPaperBooks;
    mapping(address account => Set bookIsbnList) private _ownBooks;

    constructor(address initialOwner, string memory uri) ERC1155(uri) Ownable(initialOwner) {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint48 isbn13, string memory cid) public {
        require(isbn13 > 1_000_000_000_000, "ISBN13 not valid!");
        require(bytes(cid).length > 31, "CID not valid!");

        uint256 id = paperBookIndex;
        address enrolledBy = msg.sender;
        uint enrolledAt = block.timestamp;

        PaperBook memory book = PaperBook(id, isbn13, cid, enrolledAt, enrolledBy);

        _paperBookList.push(book);
        if (!_ownBooks[msg.sender].exists[isbn13]) {
            _ownBooks[msg.sender].values.push(isbn13);
            _ownBooks[msg.sender].exists[isbn13] = true;
        }
        _ownPaperBooks[msg.sender].push(id);

        paperBookIndex++;
        _balancesIsbn[msg.sender][isbn13] += 1;

        _mint(msg.sender, id, 1, "");
    }

    function balanceOfIsbn(address account, uint16 isbn13) public view returns (uint256) {
        return _balancesIsbn[account][isbn13];
    }

    function getBooks(
        address account,
        uint240 pageNumber,
        uint16 pageSize
    ) public view returns (uint48[] memory) {
        uint256 startIndex;
        uint256 productsLength = _ownBooks[account].values.length;
        if (pageNumber == 0) {
            startIndex = 0;
        } else {
            startIndex = pageNumber * pageSize;
        }
        require(productsLength > startIndex, "Page/PageSize too big");

        uint256 endIndex = Math.min(startIndex + pageSize, productsLength);

        uint48[] memory result = new uint48[](endIndex - startIndex);
        for (uint256 i = startIndex; i < endIndex; i++) {
            result[i] = _ownBooks[account].values[i];
        }
        return result;
    }

    function getPaperBooks(
        address account,
        uint240 pageNumber,
        uint16 pageSize
    ) public view returns (PaperBook[] memory) {
        uint256 startIndex;
        uint256 productsLength = _ownPaperBooks[account].length;
        if (pageNumber == 0) {
            startIndex = 0;
        } else {
            startIndex = pageNumber * pageSize;
        }
        require(productsLength > startIndex, "Page/PageSize too big");

        uint256 endIndex = Math.min(startIndex + pageSize, productsLength);

        PaperBook[] memory result = new PaperBook[](endIndex - startIndex);
        for (uint256 i = startIndex; i < endIndex; i++) {
            uint256 paperBookId = _ownPaperBooks[account][i];
            result[i] = _paperBookList[paperBookId];
        }
        return result;
    }

    function getBooksCount(address account) public view returns (uint256) {
        return _ownBooks[account].values.length;
    }

    function getPaperBooksCount(address account) public view returns (uint256) {
        return _ownPaperBooks[account].length;
    }

    function getPaperBook(uint256 id) public view returns (PaperBook memory) {
        return _paperBookList[id];
    }

    function getBooks() public view returns (PaperBook[] memory) {
        return _paperBookList;
    }
}
