# Pay it forward hardhat project

Project used for deploying contracts

# For development (Prerequisites)
- Node `v20.11.1`
- NPM `10.2.4`
- Installed `Solidity` (and Hardhat) extension for VS Code made by Nomic Foundation (`v0.7.3`)
- Install the Hardhat for Visual Studio Code extension?
- run `npm i` to install the dependencies
- `npx hardhat --version` - `2.22.2`

# Hardhat basics
- Hardhat is designed around the concepts of `tasks` and `plugins`. 
- Every time you're running Hardhat from the command-line, you're running a `task`. 
    Ex. `npx hardhat compile` is running the `compile`task.
- Help & explore: `npx hardhat help [task]`
- Recommended plugin, by Hardhat `@nomicfoundation/hardhat-toolbox`. 
    It has everything you need for developing smart contracts.
- COMPILE: `1npx hardhat compile` - The compile task is one of the built-in tasks. 
    It compiles all the contracts in contracts dir.
- TESTS: `npx hardhat test` - Keep in mind that when you run npx hardhat test, 
    your contracts will be automatically compiled if they've changed since the last time you ran your tests.
- PLUGINS In order to use hh plugins, you need to import the plugin in hardhat.config.ts file
- DEPLOY to live networks using hh ignition modules: 
    ex. `npx hardhat ignition deploy ./ignition/modules/Token.ts`. 
    The netwark can be passed as parameter `--network <network-name>`. 
    If missing. Hardhat Local Network will be used, and the results will be lost.
    * For deploying to a live testnet, the config needs to be added in `hardhat.config.ts` 
        (TESTNET-API-KEY, ACCOUNT-PRIVATE-KEY, RPC-URL - url to any Ethereum node or gateway)
- SPIN UP A NODE: `npx hardhat node`


## Issues
1.  Property 'deployments' does not exist on type 'HardhatRuntimeEnvironment'.
Property 'getNamedAccounts' does not exist on type 'HardhatRuntimeEnvironment'.
The issue occurs a deploy script (./deploy/your-deploy-script.ts).
To solve it, import hardhat-deploy in your hardhat.config.ts to enable hardhat deploy plugin
`import "hardhat-deploy"`
See: https://github.com/NomicFoundation/hardhat/issues/3796

2.  Error HH604: Error running JSON-RPC server
This helped me: "npm update --legacy-peer-deps"
https://stackoverflow.com/a/75842218/12730428
=> namedAccount was not configured in hardhat.config.ts and the deployer was undefined, getNamedAccounts() returns undefined deployer

3.  Error: ERROR processing /home/gmarica/Documents/Development/pay-it-forward-hh/deploy/01-deploy-paperbook-nft.ts:
    Error: cannot get the transaction for PaperBookNFT's previous deployment, please check your node synced status.
Solution: delete deployments folder for specific network or entire dir

4. Run on other port when running locally blockchain using Ganache: use -p port -> it's a docker container
`"start": "lerna exec --loglevel=silent --scope ganache -- npm run start --silent -- -p 8546"`



## Basic Commands
npm hardhat deploy --network network_name -> from hardhat.config.ts
npm hardhat deploy --network localhost
npm hardhat deploy --network hardhat
npm hardhat deploy --network hardhat --tags paperBook


## Other infos
- Directories generated at compile stage:  `artifacts`, `cache`, `typechain-types`

## TODO 
`Remove this`: `p4y17f0rw4rd`
solid occur photo senior card diagram man local foam merge session animal

## Set hardhat variables - do not use dotenv
- use `npx hardhat vars set TEST_API_KEY`

## Deploied PaperBookBase to Sepolia testnet using
- `npx hardhat ignition deploy ./ignition/modules/PaperBookBase.ts --network sepolia`
- DEPLOY NR 1
✔ Confirm deploy to network sepolia (11155111)? … yes
Hardhat Ignition 🚀
Deploying [ PaperBookBase ]
Batch #1
  Executed PaperBookBase#PaperBookBase
[ PaperBookBase ] successfully deployed 🚀
Deployed Addresses
PaperBookBase#PaperBookBase - 0x0fDD4785f07e498217B3d68076965C9d6B2cB4e8

- `npx hardhat ignition deploy ./ignition/modules/PaperBookBase.ts --network sepolia --deployment-id PaperBookBase`
- DEPLOY NR 2 deployment-id PaperBookBase
✔ Confirm deploy to network sepolia (11155111)? … yes
Hardhat Ignition 🚀
Deploying [ PaperBookBase ]
Batch #1
  Executed PaperBookBase#PaperBookBase
[ PaperBookBase ] successfully deployed 🚀
Deployed Addresses
PaperBookBase#PaperBookBase - 0x090A87EbcD7Aa24B3B568C671947A305fd0B95BC
- Verified it:
`npx hardhat ignition verify PaperBookBase`
Verifying contract "contracts/PaperBookBase.sol:PaperBookBase" for network sepolia...
Successfully verified contract "contracts/PaperBookBase.sol:PaperBookBase" for network sepolia:
  - https://sepolia.etherscan.io/address/0x090A87EbcD7Aa24B3B568C671947A305fd0B95BC#code




============================================================
NOT THIS ONE, THE SECOND ONE with --deployment-id in order to be able to verify it
 `npx hardhat ignition deploy ./ignition/modules/PaperBook.ts --network sepolia`
✔ Confirm deploy to network sepolia (11155111)? … yes
Hardhat Ignition 🚀

Resuming existing deployment from ./ignition/deployments/chain-11155111

Deploying [ PaperBook ]

Warning - previously executed futures are not in the module:
 - PaperBookBase#PaperBookBase

Batch #1
  Executed PaperBook#PaperBook

[ PaperBook ] successfully deployed 🚀

Deployed Addresses

PaperBookBase#PaperBookBase - 0x0fDD4785f07e498217B3d68076965C9d6B2cB4e8
PaperBook#PaperBook - 0x2bc774A8ab6b51B4eF8982ce9f441803D3b1D8B5

===
`npx hardhat ignition deploy ./ignition/modules/PaperBook.ts --network sepolia --deployment-id PaperBook`
✔ Confirm deploy to network sepolia (11155111)? … yes
Hardhat Ignition 🚀

Deploying [ PaperBook ]

Batch #1
  Executed PaperBook#PaperBook

[ PaperBook ] successfully deployed 🚀

Deployed Addresses

PaperBook#PaperBook - 0x27df245aA5E0827f3329F74F75BfFA888e7ADA23

===
`npx hardhat ignition verify PaperBook`
Verifying contract "contracts/PaperBook.sol:PaperBook" for network sepolia...
Successfully verified contract "contracts/PaperBook.sol:PaperBook" for network sepolia:
  - https://sepolia.etherscan.io/address/0x27df245aA5E0827f3329F74F75BfFA888e7ADA23#code