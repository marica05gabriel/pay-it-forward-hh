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
- Every time you're running Hardhat from the command-line, you're running a `task`. Ex. `npx hardhat compile` is running the `compile`task.
- Help & explore: `npx hardhat help [task]`
- Recommended plugin, by Hardhat `@nomicfoundation/hardhat-toolbox`. It has everything you need for developing smart contracts.
- COMPILE: `1npx hardhat compile` - The compile task is one of the built-in tasks. It compiles all the contracts in contracts dir.
- TESTS: `npx hardhat test` - Keep in mind that when you run npx hardhat test, your contracts will be automatically compiled if they've changed since the last time you ran your tests.

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
