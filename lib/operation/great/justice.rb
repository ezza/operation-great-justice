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

        # Do a mind-numbingly simple XOR hash of each array.
        first = first.inject(0) { |h,i| h ^ i }
        last  = last.inject(0) { |h,i| h ^ i }

        # Scale the hash to the size of each word list
        first = (first.to_f / 255 * adjectives.size).to_i
        last  = (last.to_f / 255 * nouns.size).to_i

        # Collect our words
        first = adjectives[first]
        last  = nouns[last]

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
