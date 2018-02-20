RSpec.describe ArbolFinanciero::Folio do
  let(:complete_folio_response) { JSON.parse(file_fixture('complete_folio_response.json').read) }
  let(:basic_folio_response) { JSON.parse(file_fixture('basic_folio_response.json').read) }
  let(:credit_report_folio_response) { JSON.parse(file_fixture('credit_report_folio_response.json').read) }
  let(:configuration) { YAML.load_file(file_fixture('configuration.yml')) rescue {} }

  before do
    ArbolFinanciero.configure do |config|
      config.api_base = configuration['api_base'] if configuration['api_base']
      config.api_key = configuration['api_key'] || "my_api_key"
      config.secret_key = configuration['secret_key'] || "my_api_secret"
    end
  end

  it "gets a complete folio" do
    folio_id = '282'
    allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(complete_folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id, include: "**")

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("personal")
    expect(folio.included).to be_a(Array)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(1)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(1)
  end

  it "gets a basic folio" do
    folio_id = '282'
    allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(basic_folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id)

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("personal")
    expect(folio.included).to be_a(Array)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(0)
  end

  it "gets a folio with creditReports" do
    folio_id = '282'
    allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(credit_report_folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id, include: "applicant.creditReport")

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("personal")
    expect(folio.included).to be_a(Array)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(1)
  end
end
