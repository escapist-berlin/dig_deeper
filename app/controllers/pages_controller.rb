class PagesController < ApplicationController
  def home
  end

  def dashboard
  end

  def results
    @search_query = params['search']['title']
    @release = discogs_api(@search_query)
    @cover_image = discogs_api_img(@search_query)
  end

  private

  def discogs_api(search_input)
    wrapper = Discogs::Wrapper.new('DigDeeper')
    auth_wrapper = Discogs::Wrapper.new('DigDeeper', user_token: 'woLJMkIArTDEQgXUMPAAuNacoDrNRjoZRUVoVZLU')

    search = auth_wrapper.search(search_input, :per_page => 1)
    release_id = search.results.first.id.to_s
    wrapper.get_release(release_id)
  end

  def discogs_api_img(search_input)
    wrapper = Discogs::Wrapper.new('DigDeeper')
    auth_wrapper = Discogs::Wrapper.new('DigDeeper', user_token: 'woLJMkIArTDEQgXUMPAAuNacoDrNRjoZRUVoVZLU')

    search = auth_wrapper.search(search_input, :per_page => 1)
    search.results.first.cover_image
  end
end
