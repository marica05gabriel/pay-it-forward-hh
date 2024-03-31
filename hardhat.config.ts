import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-ignition";
import "hardhat-deploy"

const config: HardhatUserConfig = {
  defaultNetwork: "hardhat",
  networks: {
      hardhat: {
          chainId: 1337,
      },
      localhost: {
          chainId: 1337,
          url: "http://127.0.0.1:8546"
      }
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
      }
    ],
  },
};

export default config;
