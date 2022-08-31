class PagesController < ApplicationController
  def home
  end

  def dashboard
    @search = params['search']
    if @search.present?
      @search_query = @search['title']
    end
  end

  def results
    @results = discogs_api(@search_query)
  end

  private

  def discogs_api(search_input)
    wrapper = Discogs::Wrapper.new('DigDeeper')
    auth_wrapper = Discogs::Wrapper.new('DigDeeper', user_token: 'woLJMkIArTDEQgXUMPAAuNacoDrNRjoZRUVoVZLU')

    search = auth_wrapper.search(search_input, :per_page => 1)
    release_id = search.results.first.id.to_s
    release = wrapper.get_release(release_id)
    return release
  end

end
