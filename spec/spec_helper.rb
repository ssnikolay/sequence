require 'rspec'

Dir["#{File.dirname(__FILE__)}/../sequence/**/*.rb"].each {|f| require f}

RSpec::Matchers.define :generate_correct_sequence do |_|
  match do |klass|
    begin
      sequence = klass.new(9)
      sequence.generate
      expect(sequence.sequence).to eq %w(1 11 21 1211 111221 312211 13112221 1113213211 31131211131221)
    rescue RSpec::Expectations::ExpectationNotMetError => ex
      @message = ex.to_s
      raise ex
    end
  end
end
