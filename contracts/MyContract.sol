// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyContract is ERC20, Ownable {
  uint256 public constant FAUCET_AMOUNT = 100 * 10 ** 18;
  uint256 public constant INITIAL_SUPPLY = 1_000_000 * 10 ** 18; // 1,000,000 WTK

  constructor() ERC20("Workshop Token", "WTK") Ownable(msg.sender) {
    _mint(msg.sender, INITIAL_SUPPLY);
  }

  function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
  }

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }

  function faucet() external {
    _mint(msg.sender, FAUCET_AMOUNT);
  }
}
