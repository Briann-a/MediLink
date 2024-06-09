# HealthChain: Decentralized Medical Records Management

HealthChain is a decentralized application (dApp) that leverages Ethereum blockchain and the Interplanetary File System (IPFS) to securely manage and store medical records. This system ensures high security, privacy, and scalability, making it ideal for handling sensitive medical data across various healthcare providers.

## Features

- **Secure Record Management**: Utilizes Ethereum blockchain for immutable and tamper-proof record keeping.
- **Decentralized Storage**: Leverages IPFS for efficient and secure data storage.
- **User-friendly Interface**: Provides an intuitive client interface for easy interaction by patients and healthcare providers.
- **Flexible Integration**: Designed to easily switch from development (using Ganache) to production environments, supporting real Ethereum wallets like Metamask.

## Prerequisites

- Node.js
- npm or Yarn
- Ganache CLI
- Truffle Suite (optional for smart contract deployment and testing)
- Metamask extension for Chrome or Firefox (for production) [Not implemented]

## Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/healthchain.git
   cd healthchain
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Start Ganache**
   ```bash
   ganache-cli
   ```

4. **Deploy Smart Contracts**
   ```bash
   truffle migrate --reset
   ```

5. **Configure Metamask**
   - Connect Metamask to your local Ganache network.

## Usage

- **Start the Application**
  ```bash
  npm start
  ```

- **Accessing the Client Interface**
  - Open your web browser and navigate to `http://localhost:8485` to interact with the application.

- **Adding and Managing Records**
  - Use the client interface to add new patients or doctors and upload medical records to IPFS.
