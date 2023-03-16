// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Import Ownable from the OpenZeppelin Contracts library
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    constructor() ERC20("Token", "TKN") {
        set_price(1 ether);
    }

    uint256 private _price;

    event PriceChanged(uint256 price);

    // The onlyOwner modifier restricts who can call the store function
    function set_price(uint256 price) public onlyOwner {
        _price = price;
        emit PriceChanged(price);
    }

    function get_price() public view returns (uint256) {
        return _price;
    }
}