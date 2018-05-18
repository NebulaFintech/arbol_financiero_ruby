# frozen_string_literal: true

RSpec.describe ArbolFinanciero::ScoreTable do
  let(:score_table_hash) { JSON.parse(file_fixture("score_table.json").read) }
  let(:configuration) { YAML.load_file(file_fixture("configuration.yml")) }

  before do
    ArbolFinanciero.configure do |config|
      config.api_base = configuration["api_base"] if configuration["api_base"]
      config.api_key = configuration["api_key"] || "my_api_key"
      config.secret_key = configuration["secret_key"] || "my_api_secret"
    end
  end

  it "creates a ScoreTable" do
    score_table = ArbolFinanciero::ScoreTable.new(
      final_score: 0,
      final_score_text: "DESCALIFICADO",
      alerts: [
        ["Obligado solidario presenta cuentas MOP96/97", "try_other_os"],
        ["Obligado solidario presenta BC-Score bajo", "try_other_os"],
        ["Obligado solidario presenta cuenta con MOP4 o mayor", "alert"]
      ],
      variables: {
        "profile": "B",
        "bc_score_usr": -9,
        "relationship_with_user": "Padre/Madre",
        "education": "Licenciatura",
        "employment_status": "Empleado",
        "employment_age": "2",
        "net_income": "18000.0",
        "bc_payments_usr": 0
      },
      variable_metadata: [
        %w[profile Perfil text],
        ["bc_score_usr", "BC-Score Titular", "number"],
        ["relationship_with_user", "Relación de con Titular", "text"],
        ["education", "Máximo nivel estudios", "text"],
        ["employment_status", "Tipo de empleo", "text"],
        ["employment_age", "Arraigo empleo", "text"],
        ["net_income", "Ingreso neto", "currency"],
        ["bc_payments_usr", "Pagos a buró", "currency"]
      ]
    )
    expect(score_table.to_json).to eq(score_table_hash.to_json)
  end

  it "raises an KeyError" do
    expect do
      ArbolFinanciero::ScoreTable.new
    end.to raise_error(KeyError)
  end

  it "raises an ArgumentError" do
    expect do
      ArbolFinanciero::ScoreTable.new(
        final_score: nil,
        final_score_text: nil,
        alerts: nil,
        variables: nil,
        variable_metadata: nil
      )
    end.to raise_error(ArgumentError)
  end
end
