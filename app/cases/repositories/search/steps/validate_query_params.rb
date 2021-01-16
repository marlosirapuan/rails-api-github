# frozen_string_literal: true

class Repositories::Search::Steps::ValidateQueryParams < Micro::Case
  DEFAULT_LANG      = 'ruby'
  DEFAULT_PAGE      = 1
  DEFAULT_PER_PAGE  = 5
  DEFAULT_SORT      = 'forks'
  DEFAULT_ORDER     = 'asc'

  attributes :params

  # rubocop: disable Style/IfUnlessModifier
  def call!
    if parameter_missing?
      return Failure(:parameter_missing, result: { message: 'parameter_missing: term' })
    end

    Success(:success, result: { params: query_params })
  end
  # rubocop: enable Style/IfUnlessModifier

  private

  def query_params
    {
      term: params[:term],
      page: params[:page] || DEFAULT_PAGE,
      per_page: params[:per_page] || DEFAULT_PER_PAGE,
      sort: params[:sort] || DEFAULT_SORT,
      order: params[:order] || DEFAULT_ORDER,
      language: params[:language] || DEFAULT_LANG
    }
  end

  def parameter_missing?
    # TODO: improve this validating all params
    params[:term].blank?
  end
end
