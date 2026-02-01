# Quai Network Contract Deploy (Student Example)

A minimal Hardhat project for students to **compile and deploy** a Solidity contract on [Quai Network](https://quai.network). It uses the Quai SDK (`quais`), Hardhat, and `@quai/hardhat-deploy-metadata` for IPFS metadata.

---

## Prerequisites

- **Node.js** (v18 or v20 recommended)
- **npm** or **yarn**
- A Quai wallet with some **QUAI** on Cyprus Shard 1 (for gas)
- [Quai Network docs](https://docs.quai.network/) for RPC URLs and chain IDs

---

## Installation

1. **Clone or download** this repo and go into the project folder:

   ```bash
   cd Quai-Network-Contract-deploy
   ```

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Create your environment file** (see [Environment variables](#environment-variables) below):

   ```bash
   cp .env.example .env
   ```

   Then edit `.env` and fill in your values (especially your private key and RPC URL).

---

## Environment variables

Create a `.env` file in the project root (same folder as `hardhat.config.js`). **Never commit `.env` or share your private key.**

| Variable       | Required | Description |
|----------------|----------|-------------|
| `RPC_URL`      | Yes      | Quai RPC endpoint. Example: `https://orchard.rpc.quai.network` (Cyprus1). See [Quai docs](https://docs.quai.network/) for other shards. |
| `CYPRUS1_PK`   | Yes      | Your wallet **private key** (no `0x` needed). This account pays gas on Cyprus Shard 1. |
| `CHAIN_ID`     | Yes      | Chain ID for the network. Cyprus1 is `15000`. |
| `INITIAL_OWNER`| No       | Reserved for future use (e.g. contract constructor args). |

**Example `.env`:**

```env
RPC_URL="https://orchard.rpc.quai.network"
CYPRUS1_PK=your_private_key_here_without_0x
CHAIN_ID=15000
INITIAL_OWNER=
```

- Get testnet QUAI from a [Quai faucet](https://docs.quai.network/) if needed.
- Use a **test wallet** and never put a mainnet key in this project.

---

## Compile

From the project root:

```bash
npx hardhat compile
```

- Compiles `contracts/MyContract.sol` (and any other Solidity files in `contracts/`).
- Artifacts (ABI, bytecode) are written to `artifacts/`.

---

## Deploy

1. Ensure `.env` is set (especially `RPC_URL`, `CYPRUS1_PK`, `CHAIN_ID`).
2. Deploy to the `cyprus1` network defined in `hardhat.config.js`:

   ```bash
   npx hardhat run scripts/deploy.js
   ```

3. The script will:
   - Use your `CYPRUS1_PK` to sign the transaction
   - Push contract metadata to IPFS (via `@quai/hardhat-deploy-metadata`)
   - Deploy `MyContract` and print the transaction hash and contract address

Example output:

```
Transaction broadcasted:  0x...
Contract deployed to:  0x...
```

---

## Project structure

```
Quai-Network-Contract-deploy/
├── contracts/
│   └── MyContract.sol    # Your Solidity contract (customize or replace)
├── scripts/
│   └── deploy.js         # Deploy script using quais + Hardhat
├── hardhat.config.js     # Network (cyprus1) and Solidity settings
├── .env                  # Your secrets (create from .env.example, do not commit)
├── .env.example          # Template for .env
└── package.json
```

- **Add or change contracts** in `contracts/` and run `npx hardhat compile` again.
- To deploy a different contract, adjust `scripts/deploy.js` to load the right artifact and constructor args (see the commented ERC20 example in the script).

---

## Troubleshooting

- **"Cannot find module 'hardhat'"** → Run `npm install` in the project root.
- **"Invalid private key"** → Ensure `CYPRUS1_PK` has no `0x` and no extra spaces.
- **"insufficient funds"** → Your wallet needs QUAI on Cyprus Shard 1; use a faucet.
- **RPC errors** → Check [Quai docs](https://docs.quai.network/) for the correct `RPC_URL` and `CHAIN_ID` for your shard.

---

## Resources

- [Quai Network](https://quai.network)
- [Quai Documentation](https://docs.quai.network/)
- [Hardhat](https://hardhat.org/)
