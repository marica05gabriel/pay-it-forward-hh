# Pay it forward hardhat project

Project used for deploying contracts

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
