class VersesController < ApplicationController
  def search_verse
    # if multiple verses specified in url, separate into array to be used for multi-verse search
    if params[:verse].include? '-'
      params[:verse] = params[:verse].split('-')
    end

    # use parameters for biblesearch api verse search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter], verse: params[:verse]}
    result = Bible.verse(query)

    render json: {result: result}
  end

  def search_chap
    # use parameters for biblesearch api chapter search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter]}
    result = Bible.chap(query)

    render json: {result: result}
  end

  def save
    verse = Verse.new(verse_params)

    if verse.save
      render json: {status: 200, message: "Verse saved", verse: verse}
    else
      render json: {status: 422, message: "Bad parameters"}
    end
  end

  def show
    verse = Verse.find(params[:id])

    render json: {verse: verse}
  end

  def user_verses
    verses = User.find(params[:id]).verses

    render json: {verses: verses}
  end

  def destroy
    verse = Verse.find(params[:id])

    verse.destroy
    render json: {status: 204}
  end

  # Query biblegateway for verse of the day
  def votd
    require 'rss'

    votd = RSS::Parser.parse('http://www.biblegateway.com/usage/votd/rss/votd.rdf?31', false)

    render json: votd
  end

  private

    def verse_params
      params.required(:verse).permit(:text, :user_id, :reference)
    end
end
