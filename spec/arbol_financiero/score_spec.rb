# frozen_string_literal: true

RSpec.describe ArbolFinanciero::Score do
  let(:score_request) { JSON.parse(file_fixture("score_request.json").read) }
  let(:configuration) { YAML.load_file(file_fixture("configuration.yml")) }

  before do
    ArbolFinanciero.configure do |config|
      config.api_base = configuration["api_base"] if configuration["api_base"]
      config.api_key = configuration["api_key"] || "my_api_key"
      config.secret_key = configuration["secret_key"] || "my_api_secret"
    end
  end

  it "parses a score" do
    score = ArbolFinanciero::Utils.handle_response(score_request)
    expect(score).to be_a(ArbolFinanciero::Score)
    expect(score.disqualified).to eq(true)
    expect(score.financier_users.first.name).to eq("Jorge Gajon")
  end
end
