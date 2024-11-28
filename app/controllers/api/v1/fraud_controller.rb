module Api 
  module V1
    class FraudController < ApplicationController
      
      def classify
        data = params.require(:data).permit!.to_h
        classification = params.require(:classification)

        @classifier = ClassifierService.new
        
        @classifier.classify(data, classification)

        # store payload data for future use
        ClassifyData.create(data: data, classification: classification)

        render json: { message: 'Data classified successfully' }, status: :ok
      end

      def check
        data = params.require(:data).permit!.to_h
        classifier = ClassifierService.new

        result = classifier.check(data)

        render json: { classification: result }, status: :ok
      end

    end
  end
end