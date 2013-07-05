require "operation/great/justice/version"

module Operation
  module Great
    module Justice
      module_function

      # Given a token try and deterministly generate
      # a code name, which will always be the same
      # for any given token.
      def generate(token)
        # Split the token into two equal length arrays of bytes
        first = []
        last = []
        token.bytes.each_slice(2) { |a| first << a.first; last << a.last }

        first_pos = first.each_with_index.map { |b,i| b << i }.reduce(:+)
        first_max = first.each_with_index.map { |b,i| 0xff << i }.reduce(:+)
        first = (first_pos.to_f / first_max * adjectives.size).to_i

        last_pos = last.each_with_index.map { |b,i| b << i }.reduce(:+)
        last_max = last.each_with_index.map { |b,i| 0xff << i }.reduce(:+)
        last = (last_pos.to_f / last_max * adjectives.size).to_i

        # Collect our words
        first = adjectives[first]
        last  = nouns[last]

        # Capitalize our words
        first = first.slice(0,1).capitalize + first.slice(1..-1)
        last  = last.slice(0,1).capitalize + last.slice(1..-1)

        "Operation #{first} #{last}"
      end

      def nouns
        @nouns ||= _parts_of_speech.select { |w| w.tags.member? 'N' }.map(&:word)
      end

      def adjectives
        @adjectives ||= _parts_of_speech.select { |w| w.tags.member? 'A' }.map(&:word)
      end

      def _parts_of_speech(tag=nil)
        @parts_of_speech ||= File.open(File.expand_path('../../../../part-of-speech.txt', __FILE__), 'r').each_line.map { |l| Word.new(l) }
      end

      class Word
        attr_accessor :word
        attr_accessor :tags
        def initialize(line)
          w,t = line.split("\t")
          self.word = w
          self.tags = t.split('')
        end
      end
    end
  end
end
