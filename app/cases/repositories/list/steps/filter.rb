# frozen_string_literal: true

class Repositories::List::Steps::Filter < Micro::Case
  attributes :params

  attr_reader :total_count, :repositories

  def initialize(total_count = 0)
    @total_count  = total_count
    @repositories = repositories

    super
  end

  # rubocop: disable Style/IfUnlessModifier
  def call!
    request = handle_request
    build_response_repositories_from(request) if request

    if request.nil? || @repositories.count.zero?
      return Failure(:no_record_found, result: { message: :no_record_found })
    end

    Success(:success, result: success_data)
  end
  # rubocop: enable Style/IfUnlessModifier

  private

  def success_data
    {
      data: {
        paginate: paginate,
        repositories: @repositories
      }
    }
  end

  def paginate
    {
      total_count: @total_count,
      page: params[:page].to_i,
      per_page: params[:per_page].to_i
    }
  end

  def handle_request
    RestClient.get 'https://api.github.com/search/repositories?', { params: params }
  rescue StandardError
    nil
  end

  # rubocop: disable Metrics/MethodLength
  def build_response_repositories_from(request)
    response_body = JSON.parse(request.body)
    return [] if response_body['items'].blank?

    @total_count  = response_body['total_count']
    @repositories = []

    response_body['items'].each do |repository|
      @repositories << {
        name: repository['full_name'],
        description: repository['description'],
        stars: repository['stargazers_count'],
        forks: repository['forks_count'],
        author: repository.dig('owner', 'login')
      }
    end

    @repositories
  end
end
