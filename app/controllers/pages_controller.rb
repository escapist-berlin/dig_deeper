class PagesController < ApplicationController
  def home
  end

  def dashboard
    @releases = Release.all
  end

  def results
    @search_query = params['search']['title']
    @release = discogs_api(@search_query)
    @cover_image = discogs_api_img(@search_query)
    @list = List.find_by(title: 'spotlight')
  end

  # def create
  #   @api_release = Release.new(
  #     artist: @release.artists[0].name,
  #     title: @release.title,
  #     label: @release.labels.first.name,
  #     catalog_number: @release.labels.first.catno,
  #     format: @release.formats.first.name,
  #     released: @release.released,
  #     styles: @release.styles,
  #     tracklist: @release.tracklist.map { |track| track.title },
  #     cover_url: @cover_image
  #   )
  #   @list = List.find_by(title: 'spotlight')
  #   @api_release.list = @list
  #   # response_from_api = discogsApi()
  #   @api_release.save

  #   redirect_to dashboard_path
  # end

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
