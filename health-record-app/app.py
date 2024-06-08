from flask import Flask, request, jsonify
from web3 import Web3, HTTPProvider

# Flask app setup
app = Flask(__name__)

# Web3 setup
w3 = Web3(HTTPProvider('http://127.0.0.1:8545'))
assert w3.isConnected(), "Failed to connect to the Ethereum client."

with open('abi.json', 'r') as abi_file:
    contract_abi = json.load(abi_file)

# Contract ABI and Address (Replace with your actual ABI and contract address)
contract_address = '0xefBD725Dd7e13f036D0982dB5DeA4D8892D86FbA'  # TODO: Insert your contract's address here
health_record_contract = w3.eth.contract(address=contract_address, abi=contract_abi)

@app.route('/api/set_record', methods=['POST'])
def set_record():
    # Extract data from the request
    data = request.json
    user_address = data['user_address']
    jsonData = data['jsonData']
    isDoctor = data['isDoctor']

    # Send the transaction to set the record
    txn_dict = health_record_contract.functions.setRecord(
        user_address, jsonData, isDoctor
    ).buildTransaction({
        'from': w3.eth.defaultAccount,
        'nonce': w3.eth.getTransactionCount(w3.eth.defaultAccount),
        # additional transaction parameters like gas can be set here
    })

    # Send the transaction
    txn_hash = w3.eth.sendTransaction(txn_dict)
    
    # Return the transaction hash as a response
    return jsonify({'status': 'Transaction sent', 'txn_hash': txn_hash.hex()}), 200

@app.route('/api/get_record', methods=['GET'])
def get_record():
    # Extract query parameter for user address
    user_address = request.args.get('user_address')

    # Call the smart contract to get the record
    record = health_record_contract.functions.getRecord(user_address).call()
    return jsonify({'status': 'Record retrieved', 'record': record}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)