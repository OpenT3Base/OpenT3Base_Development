from flask import Flask, jsonify, request

app = Flask(__name__)

# Example: Get {{RESOURCE_NAME_PLURAL}}
@app.route('/{{RESOURCE_PATH}}', methods=['GET'])
def get_{{RESOURCE_NAME_SNAKE}}():
    return jsonify([{"{{ID_FIELD}}": "{{EXAMPLE_ID}}", "{{EXAMPLE_FIELD}}": "{{EXAMPLE_VALUE}}"}])

# Example: Add {{RESOURCE_NAME}}
@app.route('/{{RESOURCE_PATH}}', methods=['POST'])
def add_{{RESOURCE_NAME_SNAKE}}():
    # TODO: Add validation and database integration
    return jsonify({"message": "{{RESOURCE_NAME}} added"}), 201

if __name__ == "__main__":
    app.run(port={{PORT}})