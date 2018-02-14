RSpec.describe ArbolFinanciero::Folio do
  let(:complete_folio_response) { JSON.parse(file_fixture('folio8124.json').read) }
  let(:basic_folio_response) { JSON.parse(file_fixture('folio278.json').read) }
  let(:configuration) { YAML.load_file(file_fixture('configuration.yml')) rescue {} }

  before do
    ArbolFinanciero.configure do |config|
      config.api_base = configuration['api_base'] if configuration['api_base']
      config.api_key = configuration['api_key'] || "my_api_key"
      config.secret_key = configuration['secret_key'] || "my_api_secret"
    end
  end

  it "gets a basic folio" do
    folio_id = '278'
    allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(basic_folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id)

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("education")
    expect(folio.included).to be_a(Array)
  end

  it "gets a complete folio" do
    folio_id = '8124'
    allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(complete_folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id, include: "creditReports")

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("education")
    expect(folio.included).to be_a(Array)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(2)
    expect(folio.included.select{|i| i.type == "creditReports"}.first.bureauReportResponse).to be_a(String)
  end
end
