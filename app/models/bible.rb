class Bible < ApplicationRecord
  def self.search(query)
    #"eng-ESV:2Tim.1.5"
    puts query
    result = @biblesearch.verse(query)

    return result
  end

  def self.hello
    puts "hello world"
  end

  private
    @biblesearch = BibleSearch.new(ENV["BIBLESEARCH_API_KEY"])
end
