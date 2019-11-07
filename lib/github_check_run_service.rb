# frozen_string_literal: true

class GithubCheckRunService
  CHECK_NAME = "StandardRB"

  def initialize(report, github_data, report_adapter)
    @report = report
    @github_data = github_data
    @report_adapter = report_adapter
    @client = GithubClient.new(@github_data[:token], user_agent: "standardrb-action")
  end

  def run
    create_check = @client.post(
      endpoint_url,
      create_check_payload
    )

    id = create_check["id"]
    puts "===== create_check ====="
    puts create_check
    puts "===== create_check id ====="
    puts id

    @summary = @report_adapter.summary(@report)
    @annotations = @report_adapter.annotations(@report)
    @conclusion = @report_adapter.conclusion(@report)

    update_check = @client.patch(
      "#{endpoint_url}/#{id}",
      update_check_payload
    )
    puts "===== update_check ====="
    puts update_check
  end

  private

  def endpoint_url
    "/repos/#{@github_data[:owner]}/#{@github_data[:repo]}/check-runs"
  end

  def base_payload(status)
    {
      name: CHECK_NAME,
      head_sha: @github_data[:sha],
      status: status,
      started_at: Time.now.iso8601,
    }
  end

  def create_check_payload
    base_payload("in_progress")
  end

  def update_check_payload
    base_payload("completed").merge!(
      conclusion: @conclusion,
      output: {
        title: CHECK_NAME,
        summary: @summary,
        annotations: @annotations,
      }
    )
  end
end
