This is the core LiquidityPool contract that holds the logic for adding/removing tokens, liquidity provision, swapping, and other functionalities. Each instance of this contract represents a unique pool with its own set of assets.

The LiquidityPoolFactory contract is responsible for deploying new instances of the LiquidityPool contract. It maintains a mapping userPools to keep track of the pools created by each user, and an array deployedPools to store the addresses of all deployed pools.

The createPool function is the main entry point for creating a new pool. It deploys a new instance of the LiquidityPool contract, stores the pool address in the userPools mapping and deployedPools array, and emits a PoolCreated event.

The getUserPools and getDeployedPools functions allow retrieving the list of pools created by a specific user and the list of all deployed pools, respectively.
