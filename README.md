ReserveUSD Smart Contract

**ReserveUSD (rUSD)** is a decentralized, over-collateralized **stablecoin protocol** built on the **Stacks blockchain**, secured by Bitcoin. It allows users to **mint, redeem, and manage** a USD-pegged token backed by STX collateral, promoting stability and on-chain liquidity.

---

Overview

The **ReserveUSD Smart Contract** introduces a stable, trust-minimized digital asset that enables users to lock STX as collateral and mint **rUSD**, maintaining a 1:1 USD peg through collateral ratio enforcement and liquidation mechanisms.

Key Objectives
- Enable **STX-backed stablecoin minting** on Stacks.
- Maintain a **healthy collateral ratio** to prevent under-collateralization.
- Provide **transparent liquidation and redemption** processes.
- Facilitate **on-chain price stability** and liquidity.

---

Core Functionalities

| Function | Description |
|-----------|--------------|
| `mint-rusd` | Allows users to mint rUSD by depositing STX as collateral. |
| `redeem-rusd` | Enables redemption of rUSD for underlying STX collateral. |
| `deposit-collateral` | Adds additional collateral to increase safety margin. |
| `withdraw-collateral` | Withdraws excess collateral above the minimum ratio. |
| `liquidate-position` | Liquidates under-collateralized positions automatically. |
| `get-collateral-ratio` | Returns the collateralization ratio for a given position. |

---

Error Codes

| Error Code | Meaning |
|-------------|----------|
| `u100` | Insufficient collateral. |
| `u101` | Unauthorized action. |
| `u102` | No existing position found. |
| `u103` | STX transfer failed. |
| `u104` | Invalid amount. |

---

Technical Details

- **Language:** Clarity  
- **Blockchain:** Stacks (secured by Bitcoin)  
- **Collateral Type:** STX  
- **Token Type:** Stablecoin (rUSD)  
- **Contract Name:** `reserveusd.clar`  

---

Testing & Deployment

Using Clarinet
```bash
# Check contract syntax
clarinet check

# Run unit tests
clarinet test

# Deploy contract locally
clarinet console
