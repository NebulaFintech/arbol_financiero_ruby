RSpec.describe ArbolFinanciero::Folio do
  let(:folio_response) { JSON.parse(file_fixture("folio.json").read) }
  let(:folio_id) { "278" }

  before do
    ArbolFinanciero.configure do |config|
      config.api_key = "my_api_key"
      config.secret_key = "my_api_secret"
    end
  end

  it "gets a folio" do
    # allow_any_instance_of(ArbolFinanciero::Requestor).to receive(:request).and_return(folio_response)
    folio = ArbolFinanciero::Folio.find(folio_id, include: "creditReports")

    expect(folio).to be_a(ArbolFinanciero::Folio)
    expect(folio.id).to eq(folio_id)
    expect(folio.verticalType).to eq("education")
    expect(folio.included).to be_a(Array)
    expect(folio.included.select{|i| i.type == "creditReports"}.count).to eq(2)
    expect(folio.included.select{|i| i.type == "creditReports"}.first.bureauReportResponse).to be_a(String)
  end
end
