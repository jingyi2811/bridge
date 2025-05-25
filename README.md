# 🚀 Setup

### 🔧 Step 1: Run

```
npm install
```

and Install Openzeppline contracts using forge install

```
forge install Openzepplin/openzepplin-contracts/
```

### 🔧 Step 2: Get USDC on Optimism

Visit this link and mint some Stargate USDC for yourself

# 🚀 Bridging Guide (Sepolia ↔ Optimism Sepolia)

This guide shows how to bridge tokens between Sepolia and Optimism Sepolia using both **Hyperlane** and **Stargate** protocols.

---

## 🔹 1. Bridge OBT (ERC20) Using Hyperlane (L2 ↔ L1)

### ✅ Prerequisites

```bash
npm install -g @hyperlane-xyz/cli
```

Ensure your wallet has test ETH on both **Sepolia** and **Optimism Sepolia**.

---

### 🔧 Step 1: Deploy OBT Token on Optimism Sepolia (L2)

```bash
forge script script/hyperlane/L2/1_DeployOBTToken.s.sol \
  --rpc-url optimism-sepolia \
  --broadcast \
  -vv
```

* Contract: [`0x5011ff5f651adc7ce42133fc3c26ba11f67482bd`](https://sepolia-optimistic.etherscan.io/address/0x5011ff5f651adc7ce42133fc3c26ba11f67482bd)
* Tx: [`0x33cf9a4e10b7c8a98e4ec660fa523edcece0130655c6540e06fb7ce896e3ce00`](https://sepolia-optimistic.etherscan.io/tx/0x33cf9a4e10b7c8a98e4ec660fa523edcece0130655c6540e06fb7ce896e3ce00)

---

### 🛠 Step 2: Configure Warp Route

```bash
hyperlane warp init
```

Follow prompts:

* Network: `Testnet`
* Chains: `sepolia`, `optimismsepolia`
* Token types: `synthetic` (Sepolia), `collateral` (Optimism Sepolia)
* Owner: `0xa33E4C926A74059371A932E6AfA1c1c3560Dac35`
* Token: `0x5011ff5f651adc7ce42133fc3c26ba11f67482bd`
* Use trusted ISM: `yes`

---

### 🚀 Step 3: Deploy Warp Route

```bash
hyperlane warp deploy
```

Contract:
* Optimism Token (Collateral): [`0x5011ff5f651adc7ce42133fc3c26ba11f67482bd`](https://sepolia-optimistic.etherscan.io/address/0x5011ff5f651adc7ce42133fc3c26ba11f67482bd)

* Optimism Proxy Token (Warp Address): [`0xC4891e88E36A0746CE05cb5A5C98E0f79343427B`](https://sepolia-optimistic.etherscan.io/address/0xC4891e88E36A0746CE05cb5A5C98E0f79343427B)

* Sepolia Token (Synthetic): [`0x423654F766DEAE55605e5bd2f22F82861e4d301B`](https://sepolia.etherscan.io/address/0x423654F766DEAE55605e5bd2f22F82861e4d301B)

Tx:
* Optimism Deployment: [`0xda723b4ef2d810b423bfb67fbbb84e7c56857983f700a1361983c9e69322d632`](https://sepolia-optimistic.etherscan.io/tx/0xda723b4ef2d810b423bfb67fbbb84e7c56857983f700a1361983c9e69322d632)

* Sepolia Deployment: [`0x597906138f33b57b0dfc6a80649052fdaf4aff8a8dcdc8f54d7632c51a9e113b`](https://sepolia.etherscan.io/tx/0x597906138f33b57b0dfc6a80649052fdaf4aff8a8dcdc8f54d7632c51a9e113b)

---

### 🔁 Step 4: Bridge OBT from L2 ➝ L1

```bash
export HYP_KEY=0x<your_private_key>
hyperlane warp send --symbol OBT --relay
```

* Approval Tx: [`0xe05d5874e1b9de56d6fbc02ab6f1f553849792a5d1bda70b040a84333117d56b`](https://sepolia-optimistic.etherscan.io/tx/0xe05d5874e1b9de56d6fbc02ab6f1f553849792a5d1bda70b040a84333117d56b)
* Send Tx: [`0xa53e386bdb9875b3949e21a852c9900d087911213133ccae69f4ad20329b9c0b`](https://sepolia-optimistic.etherscan.io/tx/0xa53e386bdb9875b3949e21a852c9900d087911213133ccae69f4ad20329b9c0b)

---

## 🔹 2. Bridge USDC Using Stargate V1 (L2 ➝ L1)

```bash
forge script script/stargate/L2/1_SendUSDCToL1V1.s.sol \
  --rpc-url https://sepolia.optimism.io \
  --broadcast
```

* Approval: [`0x27d8920b730246f91ba21aee8ea6b4cc0794129d0845e098f45555c02dabd755`](https://sepolia-optimistic.etherscan.io/tx/0x27d8920b730246f91ba21aee8ea6b4cc0794129d0845e098f45555c02dabd755)
* Transfer: [`0x2cb169a5acf00ad94874c7433d01d6bfbc780856034deebc44793cfa2e3036d7`](https://sepolia-optimistic.etherscan.io/tx/0x2cb169a5acf00ad94874c7433d01d6bfbc780856034deebc44793cfa2e3036d7)

---

## 🔹 3. Bridge USDC Using Stargate V2 (L2 ➝ L1)

```bash
forge script script/stargate/L2/2_SendUSDCToL1V2.s.sol \
  --rpc-url https://sepolia.optimism.io \
  --broadcast
```

* Approval: [`0xc2fa53aad909ce0dd11b8aa0ad885e6af7e7528eba70142d9923dd6281b98cab`](https://sepolia-optimistic.etherscan.io/tx/0xc2fa53aad909ce0dd11b8aa0ad885e6af7e7528eba70142d9923dd6281b98cab)
* Transfer: [`0x9505a563518020ccd4b7ff8ab23678f4efa173ef6b00d5a557f793ff5618ee77`](https://sepolia-optimistic.etherscan.io/tx/0x9505a563518020ccd4b7ff8ab23678f4efa173ef6b00d5a557f793ff5618ee77)
