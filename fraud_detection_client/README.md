# FraudDetectionClient

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add fraud_detection_client
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install fraud_detection_client
```

## Usage

We can classify the data and train the system with Good or Bad classification and check/analyse the given data is Good or Bad

Example: 

require 'fraud_detection_client'

# Initialize the client
client = FraudDetectionClient::Client.new    # Default url ('http://localhost:3000/api/v1')

# classify endpoint
data = { 'user_agent' => 'Mozilla/5.0', 'ip' => '192.168.1.1' }
classification = 'good'

response = client.classify(data, classification)
puts "Classify Response: #{response}"

# check endpoint
result = client.check(data)
puts "Check Result: #{result['classification']}"
