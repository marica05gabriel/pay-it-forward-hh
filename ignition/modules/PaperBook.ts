import { buildModule } from "@nomicfoundation/hardhat-ignition/modules"

export default buildModule("PaperBook", (m) => {
    const paperBook = m.contract("PaperBook", [])

    return { paperBook }
})
