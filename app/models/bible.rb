class Bible < ApplicationRecord
  def self.verse(query)
    #"eng-ESV:2Tim.1.5"
    if query[:verse].is_a? Array
      result = @biblesearch.verses("#{query[:version_id]}:#{query[:book_id]}.#{query[:chapter]}","#{query[:verse][0]}", "#{query[:verse][1]}")

      merge = ""
      result.collection.each do |verse|
        merge += verse[:text]
      end

      result = merge
    else
      result = @biblesearch.verse(query).value.text
    end

    return result
  end

  private
    @biblesearch = BibleSearch.new(ENV["BIBLESEARCH_API_KEY"])
end
