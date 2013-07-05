require "bundler/gem_tasks"

namespace :words do
  task :adjectives do
    File.open('adjectives.txt', 'w') do |file|
      File.open('part-of-speech.txt', 'r').each_line do |line|
        word,tags = line.split("\t")
        file.puts(word) if tags.split('').member? 'A'
      end
    end
  end

  task :nouns do
    File.open('nouns.txt', 'w') do |file|
      File.open('part-of-speech.txt', 'r').each_line do |line|
        word,tags = line.split("\t")
        file.puts(word) if tags.split('').member? 'N'
      end
    end
  end
end

task :words => [ 'words:nouns', 'words:adjectives' ]
