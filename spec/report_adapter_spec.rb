# frozen_string_literal: true

require "./spec/spec_helper"

describe ReportAdapter do
  let(:standardrb_report) do
    JSON(File.read("./spec/fixtures/report.json"))
  end

  let(:adapter) { ReportAdapter }

  it ".conclusion" do
    result = adapter.conclusion(standardrb_report)
    expect(result).to eq("failure")
  end

  it ".summary" do
    result = adapter.summary(standardrb_report)
    expect(result).to eq("122 offense(s) found")
  end

  context "when error is on the same line" do
    it ".annotations" do
      result = adapter.annotations(standardrb_report)
      expect(result.first).to eq(
        "path" => "Gemfile",
        "start_line" => 3,
        "end_line" => 3,
        "start_column" => 8,
        "end_column" => 29,
        "annotation_level" => "failure",
        "message" => "Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping."
      )
    end
  end

  context "when error is not on the same line" do
    it ".annotations" do
      result = adapter.annotations(standardrb_report)
      expect(result[1]).to eq(
        "path" => "Gemfile",
        "start_line" => 39,
        "end_line" => 40,
        "annotation_level" => "failure",
        "message" => "Put a comma after the last item of a multiline hash."
      )
    end
  end
end
