# Fraud Detection Service

This is a prototype Ruby microservice for fraud detection.

## Setup
1. Clone the repository.
2. Install dependencies: `bundle install`
3. Setup the database: `rails db:create db:migrate` (configured Postgresql)

## API Endpoints

### Classify
- **Endpoint**: `POST /api/v1/classify`
- **Request**:
  ```json
  {
    "data": { "key": "value" },
    "classification": "good"
  }
- **Response**:
    ```json
    {
        "message": "Data classified successfully" 
    }

### Check

- **Endpoint**: `POST /api/v1/check`
- **Request**:
  ```json
  {
    "data": { "key": "value" },
  }
- **Response**:
    ```json
    {
        "classification": "Good"
    }

### Client Library

client = FraudDetectionClient.new

client.classify({ key: 'value' }, 'good')

result = client.check({ key: 'value' })

puts result


### Conclusion

This solution provides a solid foundation that:
- Uses Rails for the API with clear structure.
- Utilizes `classifier-reborn` for classification.
- Includes a simple client library.
- Is easily extendable for future improvements.


### What is Done

- **Service**: Created service for to classify and check the datasets using `classifier-reborn` gem (`check the file services/classifier_service`)
- **Model**: Created table and model for storing the data which is being used (`check the file models/classify_data`)
- **Controller**: Created API for classify and check which return the json response (`check the file api/v1/fraud_controller`)
- **Library**: Created library to build gem and use it in external projects (`check the folder fraud_detection_client`)

- **Security**: The API does not include authentication.
- **Error Handling**: Error handling should be added.