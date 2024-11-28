class ClassifierService

  def initialize
    @classifier = ClassifierReborn::Bayes.new('Good', 'Bad')
    load_classify_data
  end

  def classify(data, classification)
    # Taking key value pair as classification content
    content = data.map { |key, value| "#{key}:#{value}" }.join(' ')
    @classifier.train(classification, content)
  end

  def check(data)
    content = data.map { |key, value| "#{key}:#{value}" }.join(' ')
    @classifier.classify(content)
  end

  private

  def load_classify_data
    ClassifyData.all.each do |record|
      classify(eval(record.data).with_indifferent_access, record.classification)
    end
  end

end