// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "YOUR NOT THE OWNER!!");
        _;
    }

    constructor() ERC20("GOLD", "GL") {
        owner = msg.sender;
        _mint(owner, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
