class VersesController < ApplicationController
  def search_verse
    # if multiple verses specified in url, separate into array to be used for multi-verse search
    if params[:verse].include? '-'
      params[:verse] = params[:verse].split('-')
    end

    # use parameters for biblesearch api verse search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter], verse: params[:verse]}
    result = Bible.verse(query)

    render json: result
  end

  def search_chap
    # use parameters for biblesearch api chapter search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter]}
    result = Bible.chap(query)

    render json: result
  end

  # Query biblegateway for verse of the day
  def votd
    require 'rss'

    votd = RSS::Parser.parse('http://www.biblegateway.com/usage/votd/rss/votd.rdf?31', false)
    verse_content = votd.channel.item.content_encoded
    cleaned_verse = verse_content.split(/&[lr]dquo;/)[1]

    verse_title = votd.channel.item.title

    verse = "<h3>#{verse_title}</h3><p>#{verse_content}</p>"

    render json: verse
  end
end
