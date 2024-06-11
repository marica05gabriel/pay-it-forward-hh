import { HardhatUserConfig, vars } from "hardhat/config"
import "@nomicfoundation/hardhat-toolbox"
import "@nomicfoundation/hardhat-ignition"
import "hardhat-deploy"

const INFURA_API_KEY = vars.get("INFURA_API_KEY")
const SEPOLIA_ACCOUNT_PRIVATE_KEY = vars.get("SEPOLIA_ACCOUNT1_PRIVATE_KEY")
const ETHERSCAN_API_KEY = vars.get("ETHERSCAN_API_KEY")

const config: HardhatUserConfig = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            chainId: 1337,
        },
        localhost: {
            chainId: 1337,
            url: "http://127.0.0.1:8546",
        },
        sepolia: {
            url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
            accounts: [SEPOLIA_ACCOUNT_PRIVATE_KEY],
        },
    },
    namedAccounts: {
        deployer: {
            default: 0,
        },
        account1: {
            default: 1,
        },
    },
    solidity: {
        compilers: [
            {
                version: "0.8.20",
            },
        ],
    },
    etherscan: {
        apiKey: ETHERSCAN_API_KEY,
    },
}

export default config
