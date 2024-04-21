pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract LiquidityPool {
    using SafeMath for uint256;

    struct Token {
        IERC20 token;
        uint256 reserve;
    }

    Token[] public tokens;

    function createPool(IERC20[] memory _tokens) public {
        require(_tokens.length > 1, "At least two tokens required");

        for (uint256 i = 0; i < _tokens.length; i++) {
            tokens.push(Token(_tokens[i], 0));
        }
    }

    // Other functions for liquidity provision, swap, etc. need to be updated
    // to handle the Token[] array instead of a mapping
}
contract LiquidityPoolFactory {

    function createPool(IERC20[] memory _tokens) public returns (address) {
        LiquidityPool newPool = new LiquidityPool();
        address poolAddress = address(newPool);

        newPool.createPool(_tokens);

        userPools[msg.sender].push(poolAddress);
        deployedPools.push(poolAddress);

        emit PoolCreated(msg.sender, poolAddress);

        return poolAddress;
    }
}

# To create a new pool with multiple assets, a user would interact with the LiquidityPoolFactory contract like this:

# LiquidityPoolFactory factory = LiquidityPoolFactory(factoryAddress);
# IERC20[] memory tokens = [token1, token2, token3];
# address newPoolAddress = factory.createPool(tokens);
