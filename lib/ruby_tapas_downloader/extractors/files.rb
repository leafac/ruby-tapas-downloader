# Extract a Set of Files from an Feed Item Description.
class RubyTapasDownloader::Extractors::Files < RubyTapasDownloader::Extractor
  # @param item_description [String] the feed item description extracted with
  #   `feed.items[i].description`.
  # @return [Set<RubyTapasDownloader::Downloadables::File>] the Set of Files
  #   extracted from feed item description.
  def extract(item_description)
    files = Set.new
    document = REXML::Document.new item_description
    document.elements.each("/div[@class='blog-entry']/ul/li/a") do |element|
      name = element.text
      link = element.attribute('href').to_s
      files << RubyTapasDownloader::Downloadables::File.new(name, link)
    end
    files
  end
end
