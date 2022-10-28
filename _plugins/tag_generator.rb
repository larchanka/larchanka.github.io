require 'json'

def generateTags()
  categoryFile = File.read('./_data/tags.json')
  categories = JSON.parse(categoryFile)
  all_existing_tags = Dir.entries("tag")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

  categories.each do |tag, name|
    generate_tag_file(tag) if !all_existing_tags.include?(tag)
  end
end

def generate_tag_file(tag)
  # generate tag file
  File.open("tag/#{tag}.html", "wb") do |file|
    file << "---\nlayout: tag\ntag: #{tag}\n---\n"
  end
  # generate feed file
  # File.open("feed/#{tag}.xml", "wb") do |file|
  #   file << "---\nlayout: feed\ntag: #{tag}\n---\n"
  # end
end

def generateAuthors()
  categoryFile = File.read('./_data/author.json')
  categories = JSON.parse(categoryFile)
  all_existing_authors = Dir.entries("author")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

  categories.each do |author, name|
    generate_author_file(author) if !all_existing_authors.include?(author)
  end
end

def generate_author_file(author)
  # generate author file
  File.open("author/#{author}.html", "wb") do |file|
    file << "---\nlayout: author\nauthor: #{author}\n---\n"
  end
end

generateTags()
generateAuthors()
