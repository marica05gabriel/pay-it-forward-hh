import { DeployFunction } from "hardhat-deploy/types"
import { HardhatRuntimeEnvironment } from "hardhat/types"

const WAIT_BLOCK_CONFIRMATIONS = 1

const deployPaperBoookNFT: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
    console.info("Start deploying PaperBookNFT...")
    
    const { deployments, getNamedAccounts, network, ethers } = hre
    const { deploy, log } = deployments
    let { deployer } = await getNamedAccounts()
    
    console.info("Deployer %s", deployer)

    const args: any[] = [deployer, deployer, deployer]
    const PaperBookNFT = await deploy("PaperBookNFT", {
        from: deployer,
        args: args,
        log: true,
        waitConfirmations: WAIT_BLOCK_CONFIRMATIONS,
    })

    console.info(`Contract PaperBookNFT deployed successfully at address %s`, PaperBookNFT.address)
}

export default deployPaperBoookNFT
deployPaperBoookNFT.tags = ["all", "paperBook"]

// TODO fix prettier issues