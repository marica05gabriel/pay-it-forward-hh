export interface networkConfigItem {
    name?: string
  }
  
export interface networkConfigInfo {
    [key: number]: networkConfigItem
}

export const networkConfig:networkConfigInfo = {
    31337: {
        name: "localhost",
    },
    11155111: {
        name: "sepolia",
    },
    1: {
        name: "mainnet",
    },
}