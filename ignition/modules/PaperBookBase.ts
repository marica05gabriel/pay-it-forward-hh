import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("PaperBookBase", (m) => {
    const paperBookBase = m.contract("PaperBookBase", ["0xeF20E03C103cF9Cd4E0716e0486a6349A2daA350", "NO_URI"])

    return { paperBookBase }
})