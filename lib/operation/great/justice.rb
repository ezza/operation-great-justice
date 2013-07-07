require "operation/great/justice/version"
require 'zlib'
require 'securerandom'

module Operation
  module Great
    module Justice
      module_function

      # Given a token try and deterministly generate
      # a code name, which will always be the same
      # for any given token.
      def generate(token)
        first = Zlib.crc32(token)
        last = Zlib.crc32(token.reverse)

        first = (first.to_f / 0xffffffff * adjectives.size).to_i
        last = (last.to_f / 0xffffffff * nouns.size).to_i

        # Collect our words
        first = adjectives[first]
        last  = nouns[last]

        # Capitalize our words
        first = first.slice(0,1).capitalize + first.slice(1..-1)
        last  = last.slice(0,1).capitalize + last.slice(1..-1)

        "Operation #{first} #{last}"
      end

      def random
        first = adjectives[SecureRandom.random_number(adjectives.size)]
        last = nouns[SecureRandom.random_number(nouns.size)]

        # Capitalize our words
        first = first.slice(0,1).capitalize + first.slice(1..-1)
        last  = last.slice(0,1).capitalize + last.slice(1..-1)

        "Operation #{first} #{last}"
      end

      def nouns
        @nouns ||= File.read(File.expand_path('../../../../nouns.txt', __FILE__)).split("\n")
      end

      def adjectives
        @adjectives ||= File.read(File.expand_path('../../../../adjectives.txt', __FILE__)).split("\n")
      end
    end
  end
end
