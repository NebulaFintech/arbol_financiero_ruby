# frozen_string_literal: true

RSpec.describe ArbolFinanciero::Requestor do
  before do
    # This is needed because other tests may cause a configuration to be set.
    ArbolFinanciero.class_exec { self.configuration = nil }
  end

  describe "#initialize" do
    it "fails if no configuration block has been called" do
      expect {
        ArbolFinanciero::Requestor.new
      }.to raise_error("ArbolFinanciero.configure has not been called!")
    end

    context "With configuration" do
      it "fails if an api key is not configured" do
        ArbolFinanciero.configure do |config|
        end

        expect {
          ArbolFinanciero::Requestor.new
        }.to raise_error("Api key has not been set!")
      end

      it "fails if a secret key is not configured" do
        ArbolFinanciero.configure do |config|
          config.api_key = "my_api_key"
        end

        expect {
          ArbolFinanciero::Requestor.new
        }.to raise_error("Secret key has not been set!")
      end

      it "does not fail if everything is configured" do
        ArbolFinanciero.configure do |config|
          config.api_key = "my_api_key"
          config.secret_key = "my_secret_key"
        end

        expect {
          ArbolFinanciero::Requestor.new
        }.to_not raise_error
      end
    end
  end

  describe "#request" do
    let(:response) { double(body: "{\"data\":{}}") }
    let(:connection_double) {
      double(get: response, headers: {}).as_null_object
    }

    before do
      ArbolFinanciero.configure do |config|
        config.api_key = "my_api_key"
        config.secret_key = "my_secret_key"
      end
      ArbolFinanciero.configuration.connection = connection_double
    end

    subject { ArbolFinanciero::Requestor.new }

    it "recomputes signature for each request" do
      expect(subject).to receive(:set_headers_for).with(connection_double).twice
      subject.request "folios/123", :get
      subject.request "folios/124", :get
    end

    it "parses response" do
      expect(subject.request("folios/124", :get)).to be_kind_of(Hash)
    end
  end
end
