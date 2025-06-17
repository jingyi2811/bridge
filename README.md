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
  --rpc-url poseidontestnet \
  --broadcast \
  -vv
```

* Contract: [`0x1dC00F3Ac6056d43e04Ea62ba8980bd83273d4A4`](https://sepolia-optimistic.etherscan.io/address/0x5011ff5f651adc7ce42133fc3c26ba11f67482bd)
* Tx: [`0x76bbc48df5d9429864ae5b5dffef4cbd3d6b789f5fd4a433944d755c5dd7e75a`](https://sepolia-optimistic.etherscan.io/tx/0x33cf9a4e10b7c8a98e4ec660fa523edcece0130655c6540e06fb7ce896e3ce00)

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

* Contract:

   Optimism Token (Collateral): [`0x5011ff5f651adc7ce42133fc3c26ba11f67482bd`](https://sepolia-optimistic.etherscan.io/address/0x5011ff5f651adc7ce42133fc3c26ba11f67482bd)

   Optimism Proxy Token (Warp Address): [`0xC4891e88E36A0746CE05cb5A5C98E0f79343427B`](https://sepolia-optimistic.etherscan.io/address/0xC4891e88E36A0746CE05cb5A5C98E0f79343427B)

   Sepolia Token (Synthetic): [`0x423654F766DEAE55605e5bd2f22F82861e4d301B`](https://sepolia.etherscan.io/address/0x423654F766DEAE55605e5bd2f22F82861e4d301B)


* Tx:

   Optimism Deployment: [`0xda723b4ef2d810b423bfb67fbbb84e7c56857983f700a1361983c9e69322d632`](https://sepolia-optimistic.etherscan.io/tx/0xda723b4ef2d810b423bfb67fbbb84e7c56857983f700a1361983c9e69322d632)

   Sepolia Deployment: [`0x597906138f33b57b0dfc6a80649052fdaf4aff8a8dcdc8f54d7632c51a9e113b`](https://sepolia.etherscan.io/tx/0x597906138f33b57b0dfc6a80649052fdaf4aff8a8dcdc8f54d7632c51a9e113b)

---

### 🔁 Step 4: Bridge OBT from L2 ➝ L1

```bash
export HYP_KEY=0x3ddefe028a764206446f4064b8ab950d71b9fd30705c1a8614a875a10a1450b2
hyperlane warp send --symbol OBT --relay
```

* Approval Tx: [`0x7a2f7f088f06adbfac1d31ca7040dc7a16147d2704ea1d37493b5450ae13718e`](https://sepolia-optimistic.etherscan.io/tx/0xe05d5874e1b9de56d6fbc02ab6f1f553849792a5d1bda70b040a84333117d56b)
* Send Tx: [`0x1b89cae5e32dd87a37405178b6ad15e3c74f2ca163f60737c1c13ded437e40bc`](https://sepolia-optimistic.etherscan.io/tx/0xa53e386bdb9875b3949e21a852c9900d087911213133ccae69f4ad20329b9c0b)
