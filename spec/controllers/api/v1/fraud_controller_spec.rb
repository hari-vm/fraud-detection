require 'rails_helper'

RSpec.describe Api::V1::FraudController, type: :controller do
  let(:exp_payload) { {data: { key1: 'value1', key2: 'value2' }, classification: 'good'} }
  let(:classifier_service) { ClassifierService.new }

  describe 'POST #classify' do
    before do
      allow(ClassifierService).to receive(:new).and_return(classifier_service)
      allow(classifier_service).to receive(:classify)
      allow(ClassifyData).to receive(:create)
    end

    it 'classifies data successfully and creates a new ClassifyData record' do
      post :classify, params: exp_payload

      expect(ClassifierService).to have_received(:new)
      expect(classifier_service).to have_received(:classify).with(exp_payload[:data], exp_payload[:classification])
      expect(ClassifyData).to have_received(:create).with(data: exp_payload[:data], classification: exp_payload[:classification])
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Data classified successfully')
    end
  end

  describe 'POST #check' do
    let(:result) { 'Bad' }

    before do
      allow(ClassifierService).to receive(:new).and_return(classifier_service)
      allow(classifier_service).to receive(:check).and_return(result)
    end

    it 'checks the classification and returns the correct result' do
      post :check, params: exp_payload

      expect(ClassifierService).to have_received(:new)
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['classification']).to eq(result)
    end
  end
end